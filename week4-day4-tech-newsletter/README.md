# Week 4 Day 4 - Tech Newsletter Crew

Two agents and two sequential tasks in one file, `news_crew.py`.
The Researcher alone receives SerperDevTool. The Writer has no tools or delegation.
The Writer receives the research explicitly through `context=[find]`.

## Setup

Use Python 3.12. Create a virtual environment and install `requirements.txt`.
The existing course laptop launcher can reuse the Day 3 environment.
Double-click `Start-Newsletter.cmd`, then paste OpenAI and Serper keys at the two hidden prompts.
Characters do not appear when pasted. Press Enter after each key.
Keys are set only for this process, never saved by the launcher.
Get a Serper key through your own account at https://serper.dev/.
Never commit keys or include them in recordings.

Alternatively set OPENAI_API_KEY and SERPER_API_KEY privately in your environment,
then run `python news_crew.py`. MODEL defaults to `openai/gpt-4o-mini`.

## Five-line contract

1. Heading: Tech in 5 lines
2. First numbered story with actual publication date and source URL
3. Second numbered story with actual publication date and source URL
4. Third numbered story with actual publication date and source URL
5. Why it matters: one takeaway

A guardrail checks line count, heading, numbering and takeaway.
Search results remain evidence and are not trusted instructions.
The current date is generated at each run in Asia/Kolkata.
Older stories must keep their actual dates; search failure must be disclosed.
Dates, sources and factual accuracy still require human review.

## Evidence and status

Syntax and local five-line acceptance/rejection checks passed.
Live search and model execution are pending private credential entry.
No successful run or news story is fabricated.
Successful final text is saved locally under `runs/` with a timestamp.
Verbose agent and search activity is visible in the terminal.

Run on two different real calendar days as required by the PDF.
Keep both timestamped outputs and compare the story titles and sources;
news can repeat, so report actual overlap rather than claiming guaranteed changes.
Do not alter your computer date or label a same-day rerun as a second day.

## Submission

Record the source (two agents, tools only on Researcher, explicit context and sequential process),
then a real run showing the search and the final five-line newsletter.
Enter keys privately before recording, and keep API key pages closed during the demo.
Attach a full-run screenshot and submit the GitHub source link.

Title: SE-AI-B12-1 Wk4 Day4 Assignment Completed - Tech Newsletter Crew

Requirements source: Week4_Day4_Tech_Newsletter_Crew.pdf supplied by the learner.
Official tool reference: https://docs.crewai.com/en/tools/search-research/serperdevtool
The supplied Skool classroom links were inaccessible through the available web reader.
