# Week 4 Day 2 - LinkedIn Post Approval

## Workflow
On form submission (required Topic) -> Writer Agent -> Reviewer Agent -> Prepare approval -> Gmail Send and Wait for Response -> IF Approved?
- True: append one row to Google Sheets.
- False: stop at Rejected - nothing saved.

Each agent has its own OpenAI Chat Model node. The writer creates a 120-150 word post with a first-line hook, one call to action and at most three hashtags. The reviewer independently judges hook, clarity, CTA and factual restraint, then returns the rewritten post only, without scores or feedback. A validation node stops empty or out-of-range posts before email is sent.

## Approval behavior
Gmail sends the reviewed post to the configured owner with Approve and Reject buttons. The execution waits for up to one day. The IF condition requires the boolean `$json.data.approved` to be true. Rejection, absent approval or timeout must never save a post. Rejected posts are not appended to the sheet.

The approved branch maps:
- Date: current date in Asia/Kolkata
- Topic: original form topic, retained via Prepare approval
- Final Post: exact reviewed and validated post from Prepare approval
- Status: Approved

This workflow does not publish anything to LinkedIn.

## Import and configure
1. Import LinkedIn-Post-Approval.json into n8n.
2. Select an existing model credential in both chat model nodes, a Gmail credential in the approval node, and a Google Sheets credential in the append node.
3. Replace YOUR_EMAIL_ADDRESS with your own approval email address.
4. Create a sheet tab called Approved Posts with headers Date | Topic | Final Post | Status. Replace YOUR_GOOGLE_SHEET_ID.
5. Use the form trigger's Test URL while listening for a test submission.
6. For a no-send test, execute the trigger first and submit a topic, then execute Prepare approval. Inspect Writer, Reviewer and wordCount.
7. Only run the approval email node or the full workflow when you intend to send an approval request.
8. In a full run, approve the received request to save the post, or reject it to save nothing.
9. Publish only if you want the Production form URL to accept submissions.

Credentials remain in n8n's credential store. This public export intentionally removes personal addresses, document IDs, credential references, webhook IDs and execution data.

## Validation status - 22 October 2026
- Imported and saved as LinkedIn Post Approval in the existing n8n instance.
- Created the native Google Sheet with the four required headers.
- Existing Gmail, AI and Google Sheets credentials are selected in the live instance.
- Submitted a real Topic through the test form.
- Writer Agent and Reviewer Agent both executed successfully.
- Prepare approval validated the reviewed post: 125 words and three hashtags.
- Confirmed approval type has both Approve and Reject buttons, with a one-day wait limit.
- Live approval email delivery and wait/resume were verified.
- Execution #42 completed successfully after Approve and appended the first Approved row.
- A transient Reviewer connection error in execution #43 was recovered using Retry with currently saved workflow from the failed node. Retry execution #44 completed successfully after the learner approved the second topic, appending a second Approved row.
- Google Sheet readback confirms two data rows, both Approved, with their original topics and reviewed posts.
- The rejection no-write path is configured but remains unverified: both test emails were approved. One further rejection test is pending authorization.
- Test form URLs accept a submission only while n8n is listening. Start a new test execution before reusing the Test URL; repeated submissions after a completed run may show a submission/connection error.

## Screen recording and submission
After live approval and rejection tests pass:
1. Show the complete canvas and the separate model connection under each agent.
2. Start a test run and submit a Topic in the form.
3. Show the Writer draft and Reviewer final post.
4. Show the received approval email with both buttons and the waiting execution.
5. Click Approve and show the completed execution and new Approved sheet row.
6. Demonstrate Reject with a second request and show that the row count does not increase.
7. Show the GitHub JSON and README.

Record credential names only; never reveal keys or OAuth secrets. The learner submits the GitHub link, screenshots and screen recording to the course channels.

Submission title:
SE-AI-B12-1 Wk4 Day2 Assignment Completed - LinkedIn Post Approval Workflow
