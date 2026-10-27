# Week 5 Day 1 - AutoGen HR Assistant

One `AssistantAgent`, one `OpenAIChatCompletionClient`, an async run and `Console`. The system message is exactly `You are an HR assistant.` The task requests five numbered job-description sentences for a Junior Python Developer, with no heading so that the response itself has exactly five lines. (The PDF's illustrative sample shows a heading plus five numbered entries despite saying five lines; this implementation follows the explicit five-line requirement.)

## Run on this course laptop

Double-click `Start-HR-Agent.cmd`. Paste your OpenAI API key at the hidden prompt and press Enter. The pasted characters do not appear. The key stays in the current process and is not saved by the launcher. Wait for the agent's reply and `Validated: exactly five numbered lines.` A timestamped copy is saved locally in `runs/`.

The launcher uses the course's dedicated `work/week5day1/.venv` when present, or a project-local `.venv`. It does not change PowerShell execution policy. Never share API keys in chat, code, screenshots or GitHub.

## Setup on another computer

```powershell
python -m venv .venv
.\.venv\Scripts\python.exe -m pip install -r requirements.txt
```

Use the Windows launcher or set `OPENAI_API_KEY` privately in your environment and run `python hr_agent.py`. MODEL defaults to `gpt-4o-mini` and can be configured through an environment variable.

The client is closed in a `finally` block, including when a request fails. A format check verifies five numbered, nonempty lines and retries up to twice if necessary. The `runs/` folder is excluded from Git.

## Status and submission

Live OpenAI execution is pending private key entry. Do not present fixture output as a real run. Capture a real terminal screenshot and record the script running with key entry outside the recording. Share the source link as required by the course.

Suggested title: `SE-AI-B12-1 Wk5 Day1 Assignment Completed - AutoGen HR Assistant`

Course reference: https://github.com/Thirumurugan240/AutoGen_Framework
Official reference: https://microsoft.github.io/autogen/stable/user-guide/agentchat-user-guide/tutorial/agents.html
