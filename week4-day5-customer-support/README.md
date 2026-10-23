# Week 4 Day 5 - Multi-agent customer support buildathon

A Streamlit support desk with exactly three CrewAI agents, running sequentially.
All application code is in `app.py`.

## Assignment checklist

- [x] Assistant answers from its own knowledge, with no tools.
- [x] Web Search Assistant uses SerperDevTool and returns a sourced answer.
- [x] Entry Agent uses a custom save tool to write the original query and both answers into a local `.txt` file.
- [x] Explicit task context hands both earlier outputs to the Entry Agent.
- [x] `Process.sequential` preserves the required agent order.
- [x] Streamlit question input, progress updates, both answers and record download.
- [x] API keys read only from environment variables.
- [x] GitHub source and setup instructions.
- [x] Verify a complete live run with the learner's privately entered credentials.
- [ ] Capture the real app demo and submit the community/WhatsApp links.

The supplied PDF specifies these three roles. The video's single-agent RAG example is supporting course material; this implementation follows the multi-agent buildathon specification. The first Assistant answers directly, as required, rather than using a retrieval tool. `data/` holds generated support records, not a fabricated knowledge base.

## Start on this course laptop

1. Double-click `Start-Support.cmd`.
2. Paste the OpenAI key at the first hidden prompt, then Enter.
3. Paste the Serper key at the second hidden prompt, then Enter.
4. Open http://localhost:8501 if the browser does not open automatically.
5. Ask: `How do I reset my Gmail password?` and click **Find answers**.
6. Wait for all three stages, compare the two answers, and download the saved record.

Paste is invisible at the hidden prompts. Keys are inherited only by this app process; the launcher does not save them to a file or set permanent environment variables. Keep the terminal open while using the app. Stop with Ctrl+C in that terminal.

The launcher reuses the installed Day 3 environment on this laptop, or prefers a project-local `.venv` if present. It does not change PowerShell execution policy. It binds the local server to 127.0.0.1.

## Setup on another computer

Use Python 3.12:

```powershell
python -m venv .venv
.\.venv\Scripts\python.exe -m pip install -r requirements.txt
```

Then use `Start-Support.cmd` on Windows. On other systems set `OPENAI_API_KEY` and `SERPER_API_KEY` privately in the environment and run:

```text
streamlit run app.py
```

MODEL defaults to `openai/gpt-4o-mini` and can be changed through the environment. Never put real keys in source, GitHub, screenshots or chat.

## Record integrity

The Entry Agent's save tool reads the actual prior Task outputs; it does not accept a model-chosen filename or rewritten answer text. Each run gets a distinct `data/answers_<timestamp>_<id>.txt` file. Repeated save-tool calls in one run reuse the same record. The Entry Agent must return both original answers and the filename unchanged. The application verifies the real file contents before displaying success.

The Web Search Assistant must use its tool and cite URLs actually returned by that search. This checks provenance, not the truth of every sentence. Users should review sources, especially for account-specific questions. The app gives guidance and does not perform account changes.

Support questions and answers are saved locally. Generated records and credentials are excluded from Git. No sample output is presented as a real customer interaction.

## Validation

- Real CrewAI construction: three agents, sequential tasks, explicit two-answer Entry context.
- Actual Entry save-tool integration with labeled test fixtures: original query and both answers match the UTF-8 file exactly.
- Input checks and constrained generated file paths.
- Streamlit AppTest: initial page, blank-question feedback and both-answer display using labeled fixtures.
- Live OpenAI/Serper run verified on 23 October 2026 for the Gmail password-reset question. The UI showed both answers, Google support source links, and Entry Agent save confirmation. The local record answers_20261023_191622_1f867230.txt contains the query and both answer sections. Demo recording and learner submission remain pending.

## Demo and submission

Enter credentials before recording. Show `app.py`'s three roles, search tool, Entry save tool and sequential Crew. In the app, submit a product-specific question, show progress, both answers, and open/download the resulting text record. Finish with the GitHub folder. Keep API key pages outside the recording.

Suggested title after live verification:
`SE-AI-B12-1 Wk4 Day5 Assignment Completed - Multi-Agent Customer Support Crew`

Requirements source: `GenAI_Architect_Weekly_Buildathon_CrewAI_Assignment (1).pdf` provided by the learner.
Resources:
- https://github.com/Thirumurugan240/CrewAI_Framework
- https://github.com/Thirumurugan240/Python_Advanced
- https://docs.crewai.com/en/concepts/tasks
- https://docs.crewai.com/en/concepts/tools

Community/WhatsApp submission and recording remain with the learner.

