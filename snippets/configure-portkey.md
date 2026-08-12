
## Using OpenCode with Portkey

To support your work, we have arranged access to Anthropic models (Claude Haiku 4.5, Claude Sonnet 4.5, Claude Open 4.5, Claude Sonnet 4.6, Claude Open 4.6) via NYU's AI gateway on Portkey. 

Each student will have a weekly budget. The limit resets weekly, you cannot use more than your allocated budget in one week even if you use less than this budget in some other weeks.


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

Next, you need to configure OpenCode to access this provider. Edit the `opencode.json` configuration file described in [Setting up the OpenCode configuration file](#setting-up-the-opencode-configuration-file). Add this entry inside the `provider` object, replacing `xxxxxxxxxxxxxx` with your API key. If you add another provider after Portkey, keep the comma after the closing `}`; if Portkey is the last provider, remove that comma.

```json
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
},
```


Close and re-open `opencode`. Use `/models` to list the available models, and confirm that the Claude models appear under the Portkey provider.

When you are connected to NYU network, use `/models` to switch to a Claude Haiku model via Portkey, and confirm that you can chat with it.

You can use these in OpenCode alongside the free models from the OpenCode provider, free models from other services like Kilo or OpenRouter, or other AI subscriptions you might already have (e.g. Github Copilot, OpenAI Plus/Pro). 
