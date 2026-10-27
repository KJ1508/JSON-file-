"""Week 5 Day 1: an asynchronous AutoGen HR assistant."""
import asyncio
import os
import re
import sys
from datetime import datetime
from pathlib import Path


SYSTEM_MESSAGE = "You are an HR assistant."
TASK = (
    "Write a job description for a Junior Python Developer in exactly five "
    "numbered lines, numbered 1. through 5. Each line must be a complete, "
    "concise sentence describing a duty or qualification. No title, blank "
    "lines, introduction, conclusion, markdown fences or extra text."
)


def valid_description(text):
    lines = text.strip().splitlines()
    return len(lines) == 5 and all(
        re.fullmatch(rf"{number}\.\s+\S.*", line.strip())
        for number, line in enumerate(lines, 1)
    )


async def main():
    if not os.getenv("OPENAI_API_KEY", "").strip():
        print("OpenAI API key is missing. Launch Start-HR-Agent.cmd and enter it privately.", file=sys.stderr)
        return 2
    from autogen_agentchat.agents import AssistantAgent
    from autogen_agentchat.ui import Console
    from autogen_ext.models.openai import OpenAIChatCompletionClient

    client = OpenAIChatCompletionClient(model=os.getenv("MODEL", "gpt-4o-mini"))
    try:
        agent = AssistantAgent(name="hr_assistant", model_client=client,
                               system_message=SYSTEM_MESSAGE)
        for attempt in range(3):
            request = TASK if attempt == 0 else (
                "Your last answer did not follow the required format. " + TASK
            )
            result = await Console(agent.run_stream(task=request))
            reply = result.messages[-1].content
            if isinstance(reply, str) and valid_description(reply):
                output = Path(__file__).resolve().parent / "runs"
                output.mkdir(exist_ok=True)
                path = output / (datetime.now().strftime("%Y-%m-%d_%H%M%S") + "_hr_reply.txt")
                path.write_text(reply.strip() + "\n", encoding="utf-8")
                print("\nValidated: exactly five numbered lines.")
                print("Saved reply:", path)
                return 0
            print("The response was not exactly five numbered lines; retrying." if attempt < 2
                  else "Could not obtain the required five-line format.", file=sys.stderr)
        return 1
    finally:
        await client.close()


if __name__ == "__main__":
    try:
        sys.exit(asyncio.run(main()))
    except KeyboardInterrupt:
        print("\nRun cancelled.", file=sys.stderr)
        sys.exit(130)
    except Exception as error:
        print("HR assistant failed (" + type(error).__name__ + "). Check API access and try again.", file=sys.stderr)
        sys.exit(1)
