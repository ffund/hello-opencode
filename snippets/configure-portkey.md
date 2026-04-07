
## Using OpenCode with Portkey

To support your work in this class, we have arranged access to Anthropic models (Claude Haiku 4.5, Claude Sonnet 4.5, Claude Open 4.5, Claude Sonnet 4.6, Claude Open 4.6) via NYU's AI gateway on Portkey. 

The intent is for you to use AI coding to integrate your already-implemented ML feature into the open-source software service that you built it for. Since the open-source software may be a large unfamiliar code base, potentially in a language you are unfamiliar with, and writing software is not a major objective of this course, it is reasonable to offload some of this task onto an AI agent.

We have budgeted $20/week per student. The limit resets weekly, you cannot use more than $20 in one week even if you use less than $20 in some other weeks.


> **Note**: You can *only* access NYU AI's gateway if you are either on NYU network (e.g. NYU WiFi) or connected to NYU VPN. Follow the instructions at [NYU VPN](https://www.nyu.edu/life/information-technology/infrastructure/network-services/vpn.html) to set up VPN access for off-campus use.

To configure OpenCode for NYU's AI gateway on Portkey:

1. Log in to Portkey at [https://app.portkey.ai/](https://app.portkey.ai/): 
  * Choose Single sign-on,
  * Put in your NYU email (netID@nyu.edu), 
  * Choose the RTS organization
  * and authenticate. 
2. Use the organization switcher in the bottom left to switch to "TSOE - Tandon School of Engineering", and then the workspace switcher in the top left to switch to "ML systems engineering and operations" workspace.
3. Click on "API keys" from the menu on the left side. 
4. Click "Create" on the top right.
5. Set the API key type to "User" and then create your key. When the key is displayed, copy the key and keep it in a safe location. 

Next, you need to configure OpenCode to access this provider. To do this, you will need to edit the `opencode.json` configuration file. You can find the location of the [global configuration](https://opencode.ai/docs/config/#locations) for your platform and edit that, or you can create an `opencode.json` in your project root directory.  

But, if you choose an `opencode.json` in your project root directory, make sure to add it to your `.gitignore` - it will have your Portkey API key and should *not* be added to your Git repository.

Either way, paste this into the config file, but in place of `xxxxxxxxxxxxxx` substitute your actual API key:

```json
{
   "$schema": "https://opencode.ai/config.json",
   "provider": {
     "portkey": {
       "npm": "@ai-sdk/openai-compatible",
       "name": "Portkey",
       "options": {
         "baseURL": "https://ai-gateway.apps.cloud.rt.nyu.edu/v1",
         "headers": {
             "x-portkey-api-key": "xxxxxxxxxxxxxx"
         }
       },
      "models": {
        "@vertexai/anthropic.claude-haiku-4-5@20251001": {
          "name": "Claude Haiku 4.5 (20251001)"
        },
        "@vertexai/anthropic.claude-sonnet-4-5@20250929": {
          "name": "Claude Sonnet 4.5 (20250929)"
        },
        "@vertexai/anthropic.claude-opus-4-5@20251101": {
          "name": "Claude Opus 4.5 (20251101)"
        },
        "@vertexai/anthropic.claude-sonnet-4-6": {
          "name": "Claude Sonnet 4.6"
        },
        "@vertexai/anthropic.claude-opus-4-6": {
          "name": "Claude Opus 4.6"
        }	
      }
     }
   }
}
```


Close and re-open `opencode`. Use `/models` to list the available models, and confirm that the Claude models appear under the Portkey provider.

When you are connected to NYU network, use `/models` to switch to a Claude Haiku model via Portkey, and confirm that you can chat with it.

You can use these in OpenCode alongside the free models from the OpenCode provider, free models from other services like OpenRouter or NVIDIA NIM, or other AI subscriptions you might already have (e.g. Github Copilot, OpenAI Plus/Pro). 
