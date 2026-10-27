# Week 5 Day 3 - AutoGen Customer Support Chatbot

Based on the learner's transcript of the assignment instructions: build a customer-support chatbot with a manager that routes each question to a specialist department. The video also demonstrates an SEO team as a teaching example; this customer-support chatbot is the stated assignment.

The app has six agents: one Manager and five specialists for IT, Admin, HR, Accounts and Complaints. `SelectorGroupChat` first selects the manager, then routes to the manager's chosen specialist. The chosen agent responds in a Streamlit chat UI. Each question is routed independently; conversation history displayed in the interface is not sent to the agents as memory.

This is a demo that gives general guidance. It has no access to company-specific policies, customer accounts or ticket systems; it does not submit requests or perform account actions.

## Run on this course laptop

Double-click `Start-Customer-Support.cmd`, paste your OpenAI API key at the hidden prompt and press Enter. The pasted key does not appear and stays in the current processes. The app opens locally at http://localhost:8503. Keep the terminal open while using it.

Try questions such as `My laptop cannot connect to Wi-Fi` (IT), `How do I request leave?` (HR), and `I want to complain about a delayed response` (Complaints). Verify the manager's selected department and the specialist's answer. No other API key is required.

## Setup elsewhere

Create a Python 3.12 virtual environment, install `requirements.txt`, set `OPENAI_API_KEY` privately, and run `streamlit run app.py`. MODEL defaults to `gpt-4o-mini`. The model client is closed in `finally`. Do not place keys in code, chat, recordings or GitHub.

## Status

Offline fixture tests exercised the real AutoGen SelectorGroupChat through all five manager routes and specialist replies, rejected ambiguous route labels, confirmed client cleanup and tested Streamlit chat rendering. Live OpenAI tests routed a Wi-Fi question to IT and a leave request to HR, and both specialists returned answers. Admin, Accounts and Complaints were tested using offline fixtures; live tests for those three were not performed. Demo recording and submission remain pending. The assignment's written PDF has not been provided; the user-provided video transcript is the current requirements source.

Course resource: https://github.com/Thirumurugan240/AutoGen_Framework

