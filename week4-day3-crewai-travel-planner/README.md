# Week 4 Day 3 - CrewAI Travel Planner

One Python file, one Travel Planner agent, one task and one crew. The program asks for a city with `input()`, calls `crew.kickoff(inputs={"city": city})` and prints three numbered suggestions. Each suggestion includes a place, a reason to visit and a practical tip.

## Requirements

- Python 3.12 recommended for this tested setup.
- An OpenAI API key with access to the model in `MODEL`.
- Dependencies in `requirements.txt`.

## Setup

```powershell
python -m venv .venv
.\.venv\Scripts\python.exe -m pip install -r requirements.txt
```

The application reads `OPENAI_API_KEY` and `MODEL` from environment variables. Do not put a real key into the Python code, GitHub, screenshots or chat.

On Windows, run `Start-Travel-Planner.cmd` or `powershell -NoProfile -File .\run.ps1`. The launcher asks for the key with hidden input if it is not already set, makes it available only to this process and its Python child, and restores the previous value afterward. It does not save the entered key to a file.

If the environment variables are already set:

```powershell
.\.venv\Scripts\python.exe travel_planner.py
```

Default model: `openai/gpt-4o-mini`. Change the `MODEL` environment variable if your key has access to a different compatible OpenAI model.

## Try three cities

Run the program separately with:

1. Jaipur
2. Chennai
3. Paris

Alternatively, run `Test-Three-Cities.cmd`. It prompts privately for the key once, runs all three cities, and saves the real verbose output under `logs/Jaipur.txt`, `logs/Chennai.txt` and `logs/Paris.txt`. Those logs are excluded from Git by default.

Confirm that each run produces exactly three different places for that city. Suggestions come from model knowledge; this version does not browse or verify current prices, opening hours or availability.

The backstory targets first-time independent visitors with limited time. The expected output specifies exactly three numbered lines with no essay. A deterministic task guardrail rejects extra lines, bad numbering and duplicate place names and permits up to two repairs.

## Validation status

- Syntax and local output-format checks are implemented and tested.
- Valid three-place output is accepted; additional lines and duplicate places are rejected.
- Blank-city and missing-key CLI checks return clear errors without making an API call.
- CrewAI 1.15.28 is installed in an isolated environment. Real framework construction of one Agent, one Task, one Crew and the guardrail passed without a model request.
- Windows PowerShell launcher syntax was checked.
- Live model calls and the three-city comparison are pending a privately configured OpenAI API key. No live output or screenshot is fabricated.

## Record your demo

1. Open `travel_planner.py` and briefly show the role, goal, backstory, Task, expected output and Crew.
2. Launch the program. Enter your key privately BEFORE starting the recording.
3. Start screen recording and enter Jaipur at `Which city?`.
4. Show the verbose agent/crew output and the final three suggestions.
5. Repeat for Chennai and Paris to show the suggestions change.
6. Show the GitHub project folder and source file.
7. Capture a screenshot of one full real run with the verbose output visible above the answer.

Submit the source-code link and the real-run screenshot, and post your recording in the course community. Course submissions/messages are completed by the learner.

Submission title:

`SE-AI-B12-1 Wk4 Day3 Assignment Completed - CrewAI Travel Planner Agent`

## References and scope

- Course resource: https://github.com/Thirumurugan240/CrewAI_Framework
- Classroom: https://www.skool.com/social-eagle-ai-6384/classroom/17b2e5dd?md=c1cc0b154f3a4f4bb31300bd4383b23b
- CrewAI agents: https://docs.crewai.com/en/concepts/agents
- CrewAI tasks and guardrails: https://docs.crewai.com/en/concepts/tasks
- CrewAI models: https://docs.crewai.com/en/concepts/llms

This folder implements the Day 3 Travel Planner PDF. The supplied weekly buildathon PDF describes a separate three-agent customer-support application with Streamlit; that app is not part of this Day 3 deliverable. The private classroom page required sign-in in the available browser, so the Day 3 PDF is the requirements source.
