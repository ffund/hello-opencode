

### Add Playwright MCP

You may want to also add the Playwright MCP to your OpenCode configuration - this will enable your AI agent to open a browser and interact with your browser-based service in order to validate its changes.

To add the Playwright MCP, open your `opencode.json` config file again. Between the `$schema` and `provider` lines,

```json
   "$schema": "https://opencode.ai/config.json",
   "provider": {
```

paste the following:

```json
  "mcp": {
    "playwright": {
      "type": "local",
      "command": [
        "npx",
        "@playwright/mcp@latest"
      ],
      "enabled": true
    }
  },
```

Close and re-open OpenCode. Inside OpenCode, run

```
/mcps
```

and confirm that Playwright is listed. Test it - try prompting it to open a URL in a browser and click on a particular UI element.