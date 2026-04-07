# Hello, OpenCode

OpenCode is an open-source AI coding agent that runs in your terminal. You can ask it to inspect files, make changes, run tests, use Git, and report back with evidence about what it actually did.

For AI-assisted coding, there are three widely used workflows: chat, IDE, and CLI. 

* A chat interface is useful for brainstorming, asking questions, comparing approaches, reading about unfamiliar concepts, or sketching out a plan before touching code. But it is not a great option for actual implementation work because the human has to be in the loop and copy code out of the chat, deploy manually, and copy context back into the chat.
* An IDE-based workflow (e.g. Cursor, Antigravity) is strong for local code reading, autocomplete, refactoring, and making fast in-file changes while you stay in the editor and supervise. It is especially good for a workflow where the human plans to *also* write and modify code, instead of only giving instructions to the AI agent. IDE agents can sometimes also run tests, terminal commands, and other validation steps, but the IDE interaction model is still focused on the editor, with operational validation more of an afterthought.
* A CLI agent (e.g. OpenCode, Claude Code, Codex CLI) is great for explicit execution across the whole development workflow. If you want a coding agent to write or modify code, deploy it using shell commands, and verify that it worked, a CLI workflow is often most natural.

While there are several widely used CLI agent harnesses, we will use OpenCode, for practical reasons:

* It uses a bring-your-own-provider model. You are not locked into one model company, one subscription, or one billing path. You can connect different providers from a *very* extensive list, choose models based on cost or capability, and switch when your needs change.
* It works well in teaching and experimentation settings because students can combine sponsored access, paid accounts, and free providers.
