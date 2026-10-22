# Week 4 Day 1 — Unread Email Summariser

Import template for the supplied Gmail AI Agent assignment.

## Set up in your existing n8n instance

1. Create a new workflow. From its menu choose **Import from URL** and paste:
   https://raw.githubusercontent.com/KJ1508/JSON-file-/main/week4-day1-gmail-ai-agent/Unread-Email-Summariser.json
   If URL import is unavailable, download the JSON and use **Import from File**.
2. Open **Set your email** and replace `YOUR_EMAIL_ADDRESS` with your own Gmail address.
3. In **Get 5 unread emails** and **Send one summary email**, select your existing Gmail credential. In **OpenAI Chat Model**, select your existing OpenAI credential.
4. To test without sending, open **Send one summary email** and choose **Execute previous nodes**. To send a digest to your configured address, click **Execute workflow** once. This reads up to five unread messages and sends ONE digest.
5. Check the received email and the execution results. Capture the workflow canvas and received digest.

## Flow

Manual Trigger → Set your email → Gmail Get Many → AI Agent → Enforce summary format → Aggregate → Gmail Send.

OpenAI Chat Model connects to the AI Agent's model input.

- Gmail: Message / Get Many; Return All off; Limit 5; Simplify on; Read Status unread.
- AI input: sender, subject, snippet only.
- Each summary is one line of at most 20 whitespace-separated words.
- A small formatting node enforces line and word limits, and stops if a summary is empty.
- Aggregate collects the `output` field into one array; Gmail joins that array into one text email.
- The subject reflects the actual number of summaries. With fewer than five unread emails, fewer summaries are sent. With no unread emails, downstream nodes receive no items and no digest is sent.
- Messages are not marked read or deleted. Repeated runs may summarise the same unread messages, including a previous digest if that digest is unread.
- Manual Trigger does not require publishing for an on-demand run.
- No API keys, OAuth secrets, mailbox contents or personal recipient address are included.

## Validation status

JSON syntax, node names and connection targets were checked during creation.
Node settings were prepared using official n8n source definitions and the existing exported OpenAI model configuration.
Live execution verified on 22 October 2026 in the existing n8n instance:
- Gmail retrieved 5 unread messages with the existing OAuth credential.
- The configured AI model returned 5 summaries.
- The formatting node enforced one line and at most 20 words per summary.
- Aggregate produced one item containing 5 summaries.
- After explicit user approval, the Gmail send node sent ONE plain-text digest with subject `Your 5 unread emails`.
- The exact returned Gmail message was read back and verified in INBOX and SENT. It contained 5 summaries, each at most 20 words, separated by blank lines.

No new credentials were required. Mailbox content, personal addresses and credential identifiers are intentionally excluded from this public repository.

## Assignment submission

After a successful real execution:
- Save screenshots of the workflow canvas and the summary email.
- Export the final configured workflow from n8n and inspect it for personal data before uploading.
- Share the GitHub link in the assignment WhatsApp group yourself.
- Record the workflow run and post the video in the course community yourself.

The Voice AI Agent attachment is a separate workflow and was not needed to build this Gmail assignment template.

## Short screen-recording demo

1. Open the existing saved workflow and show the connected nodes.
2. Explain: read 5 unread emails, generate one short summary per email, combine them, send one digest to yourself.
3. Show Gmail Get Many: unread filter and limit 5. Do not open credential editors or show keys.
4. If demonstrating a new live run, click Execute workflow ONCE; this sends another digest. Otherwise show the already successful execution.
5. Show the 5 AI outputs, the single aggregated item and the successful send node.
6. Open the received digest in Gmail and show the 5 separated summaries. Hide unrelated private emails while recording.
7. Finish by showing this repository folder and its JSON and README files.

The screen recording and course/community submission remain for the learner to complete.
