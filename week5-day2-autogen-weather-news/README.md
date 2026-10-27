# Week 5 Day 2 - AutoGen Weather News

One AutoGen `AssistantAgent` uses a typed, documented `search_weather_news(city)` function backed by keyless DuckDuckGo `DDGS.news`. It takes a city with `input()`, uses `reflect_on_tool_use=True`, prints the tool interaction and a three-line response using `Console`, and closes its OpenAI model client in `finally`.

The third line includes a source URL returned by the tool. A validation check requires exactly three lines and at least one real search-result URL for the requested city; failed searches do not get saved as successes. Article snippets and publication dates can be old, incomplete or incorrect; this is a news search, not a live weather service. Check article dates and consult official local forecasts for decisions.

## Course laptop

Double-click `Test-Two-Cities.cmd`. Paste your OpenAI key at the hidden prompt and press Enter; the characters will not appear. It runs Chennai and Paris in order and stops if one fails. Each successful reply is saved in the `runs/` folder. The key stays in the running processes and is not saved. No Serper key is needed.

Alternatively, `Start-Weather-News.cmd` runs one chosen city. Enter the OpenAI key privately, then type the city name when prompted.

## Setup elsewhere

Use Python 3.12, create `.venv`, and install `requirements.txt`. The launchers prefer a project-local `.venv`, otherwise reuse `work/week5day1/.venv` on this course laptop. If using an environment directly, set `OPENAI_API_KEY` privately and run `python weather_news.py`. The model defaults to `gpt-4o-mini` and can be changed through MODEL.

## Validation and submission

A live DuckDuckGo search for Chennai returned news results. An offline AutoGen fixture test verified tool execution, reflection, three-line validation, source checking, saving and client cleanup. Live OpenAI and DuckDuckGo runs completed on 27 October 2026 for Chennai and Paris. Both produced and saved three lines with different source URLs. The selected Chennai article was dated 7 October and the Paris article 24 October; they are historical news results, not proof of today's weather. The search time filter was also checked and still returned older results. No fixture is presented as a live result. After real tests, capture a screenshot showing the tool call and three-line reply, and record the agent running with key entry outside the recording. Share the source link and video as required by the course.

Suggested title after live verification: `SE-AI-B12-1 Wk5 Day2 Assignment Completed - AutoGen Weather News Agent`

Course reference: https://github.com/Thirumurugan240/AutoGen_Framework
AutoGen tools: https://microsoft.github.io/autogen/stable/user-guide/agentchat-user-guide/tutorial/agents.html

