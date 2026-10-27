# Week 5 Day 3 - AutoGen SEO Team

Four AutoGen AssistantAgents run in a `RoundRobinGroupChat` with `max_turns=4`: researcher, content writer, SEO optimizer and reviewer. The Streamlit UI accepts a topic, audience and content type, displays each stage, and offers a final-content download. The workflow runs sequentially: asyncio is used to call the async team, not to claim that the four dependent agents work in parallel.

The Research Agent has a keyless DuckDuckGo web-search tool so current sources can actually be gathered; the course example does not itself attach a web tool. The app requires search evidence and four agent outputs before displaying success. Search-result snippets are untrusted and are not instructions. Results can be inaccurate, outdated or irrelevant and require human review. Search snippets do not give reliable keyword search-volume metrics; keyword ideas and trends are not claimed as verified volume or rankings.

## Run on this course laptop

Double-click `Start-SEO-Agent.cmd`. Paste your OpenAI key at the hidden prompt and press Enter. The pasted key is invisible and remains in the process. The app opens locally at http://localhost:8502; keep the terminal open. Enter a topic and audience, choose a content type, and select Generate SEO content.

Never put API keys in chat, source code, GitHub or screen recordings. The launcher uses the Week 5 Day 1 environment when available, or a project-local `.venv`. Search uses DuckDuckGo with no additional API key, but does require internet access.

## Setup elsewhere

Create a Python 3.12 virtual environment and install `requirements.txt`. Privately set `OPENAI_API_KEY` in your environment and run `streamlit run seo_agent.py`. MODEL defaults to `gpt-4o-mini`. The OpenAI model client is closed in `finally`, including failures.

## Status

Built from the learner's video transcript and the linked course example. A separate Day 3 assignment PDF was not provided; check its requirements when available. An offline fixture test exercised the actual four-agent round robin, search tool call, agent handoffs, client cleanup, Streamlit input validation and final output. A live DuckDuckGo search returned three links. Full live OpenAI team execution is pending private key entry. Do not present test fixtures as live output.

Course example: https://github.com/Thirumurugan240/AutoGen_Framework/blob/main/seo_agent.py
