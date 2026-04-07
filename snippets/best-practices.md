

## Best practices for modifying large codebases with AI agents

Finally, it's worth noting some best practices for coding with AI agents. The following diagram illustrates a common workflow:

![Coding with AI agents - workflow.](images/loop.svg)

When writing code by hand, your human effort is concentrated in the "implement", "deploy", and "verify" stages. But when you are working with an AI agent, you are going to largely offload those stages to the AI agent. Instead, your human effort is concentrated in the "plan" and "review" stages - and ideally, mostly in the "plan" stage and the "review" stage is trivial, if you have set yourself up for success.

Under these circumstances, you're not going to want to iterate on code (e.g. prompt the agent to write code, review it, prompt the agent to change it because it doesn't match your intent, repeat, etc), because iterating on code:

* is expensive in terms of dollar cost - letting the agent generate code again and again will quickly eat up your budget!
* is expensive in terms of human cognitive effort - rather than reviewing lots of code, it is a lot easier to instead iterate on the *plan* in natural language, and let the agent generate code only once your intent is clearly communicated and well specified.

Virtually every session should start in "plan" mode (use the Tab key in OpenCode to toggle between "plan" and "build" mode), and only progress to "build" once you have clearly communicated intent.

Furthermore, to reduce the human effort required in the "review" stage, you will probably want to break the implementation up into tiny, individually verifiable chunks. You'll go through that entire workflow illustrated above - from "plan" to "merge" for each tiny chunk before moving on to the next. This makes both "plan" (communicating your intent) and "review" (making sure the implementation matches your intent and doesn't take "shortcuts") much easier.

In between "plan" and "review", you will want the agent to be able to implement, deploy, and verify its own work. You *don't* want human effort to be required in that stage, since the model may iterate on "implement > deploy > verify" several times, and it should be able to do this independently without your intervention. You will give it instructions to access your "dev" deployment (e.g. "Use bash to SSH to cc@A.B.C.D where the service is deployed in a Docker container") so that it can test.

Here are some other "rules" that I think make AI coding easier:

* **Rule 1: Always start from a working system state.** Get a working "dev" deployment up and running before asking an AI agent to add any features! This way, the AI agent can test its work in a real deploymment, and know if it breaks the service.
* **Rule 2: Change one smallest meaningful observable unit at a time.** Break the work into chunks, where each chunk is a complete unit that changes behavior in an observable way (whether through UI, logs, or something else). This makes the human effort involved in "plan" and "review" much simpler. 
* **Rule 3: Isolate each unit in its own branch and merge when validated.** Ask the agent to create a branch for each "chunk" of work, and to merge each branch after review. This makes review much simpler. It also makes it easy to abandon a "chunk" of work (or a sequence of them!) and start it again, or to take a different approach.
* **Rule 4: Define success (pass/fail) before coding.** As part of the "plan" stage, you should know *how* you can tell if it worked! This might mean expected UI behavior, specific log lines in output, or something else. Make sure you communicate this, too, so that the agent can verify its work.
* **Rule 5: Put the agent in the eval loop.** The coding agent should evaluate its own work: push commits to its branch, pull the branch in the "dev" deployment environment, de-deploy, and verify. This way, it can go back and fix any mistakes independently.
* **Rule 6: Optimize for human review throughput.** Finally, we want to plan our workflow around making "review" easy. This is because review is typically the bottleneck in AI coding. If we invest effort in planning so that intent is clear, keep each diff small so it is easy to see if it follows through on the intent, and have the agent check for evidence of success in the "verify" stage, then approval decisions are obvious. 

Some other helpful practices include:

Switch between models (small models for small tasks, large models for complex tasks). Claude models are "ordered". From *simplest/fastest/cheapest* to *most capable for complex tasks/slowest/most expensive*, they are: Haiku, Sonnet, Opus.

Write and maintain an `AGENTS.md`, but keep it small. For example, instead of telling the model at the beginning of each session:

```
You are working on the BabyBuddy repo.
It is running in a Docker container at 129.114.26.135.

Workflow requirements:
1) Make code changes locally in this repository in a new feature branch.
2) Commit only scoped files for this chunk.
3) Push your changes to the feature branch.
4) Use bash to SSH to cc@129.114.26.135, pull the same branch on remote, and validate.

Validation requirements:
- Verify behavior in browser at http://129.114.26.135
- Or verify with docker logs on remote if browser validation is not enough
- Validation should show that changes work as expected, not only that code runs.
```

you could put all this in an `AGENTS.md` file in the project root. (You can commit this to Git, too!) The model will read this in at the beginning of a session.

Finally, keep context clean. The entire conversation history is sent to the model as input each time you add a prompt. The cost increases and the model quality degrades as this history gets longer. Start a new session when you are starting a new task; this usually improves results, lowers cost, and makes it easier for the model to stay aligned with your actual intent.



