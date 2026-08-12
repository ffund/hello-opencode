
## Using OpenCode with NRP

The [National Research Platform (NRP)](https://nrp.ai/) provides access to hosted AI models through its inference service. To use NRP, you must first sign in and receive access to an NRP namespace from an instructor or supervisor. Faculty members can request their own namespace and administrator privileges.

After you have been added to a namespace, create an API key at [https://nrp.ai/llmtoken/](https://nrp.ai/llmtoken/).

Then edit the `opencode.json` configuration file described in [Setting up the OpenCode configuration file](#setting-up-the-opencode-configuration-file). Add this entry inside the `provider` object, replacing `xxxxxxxxxxxxxx` with your NRP API key. 

```json
"NRP": {
  "npm": "@ai-sdk/openai-compatible",
  "name": "NRP",
  "options": {
    "baseURL": "https://ellm.nrp-nautilus.io/v1",
    "apiKey": "xxxxxxxxxxxxxx"
  },
  "models": {
    "qwen3": {
      "name": "Qwen3",
      "limit": { "context": 1010000, "output": 32768 },
      "modalities": { "input": ["text", "image", "video"], "output": ["text"] },
      "variants": {
        "thinking": { "chat_template_kwargs": { "enable_thinking": true, "preserve_thinking": true } },
        "instruct": { "chat_template_kwargs": { "enable_thinking": false } }
      }
    },
    "qwen3-small": {
      "name": "Qwen3 Small",
      "limit": { "context": 1010000, "output": 32768 },
      "modalities": { "input": ["text", "image", "video"], "output": ["text"] },
      "variants": {
        "thinking": { "chat_template_kwargs": { "enable_thinking": true, "preserve_thinking": true } },
        "instruct": { "chat_template_kwargs": { "enable_thinking": false } }
      }
    },
    "gpt-oss": {
      "name": "GPT-OSS 120B",
      "limit": { "context": 131072, "output": 32768 },
      "modalities": { "input": ["text"], "output": ["text"] }
    },
    "gemma": {
      "name": "Gemma 4 31B",
      "limit": { "context": 262144, "output": 32768 },
      "modalities": { "input": ["text", "image", "video"], "output": ["text"] },
      "variants": {
        "thinking": { "chat_template_kwargs": { "enable_thinking": true } },
        "instruct": { "chat_template_kwargs": { "enable_thinking": false } }
      }
    },
    "gemma-small": {
      "name": "Gemma 4 12B",
      "limit": { "context": 262144, "output": 32768 },
      "modalities": { "input": ["text", "image", "video", "audio"], "output": ["text"] },
      "variants": {
        "thinking": { "chat_template_kwargs": { "enable_thinking": true } },
        "instruct": { "chat_template_kwargs": { "enable_thinking": false } }
      }
    },
    "kimi": {
      "name": "Kimi K2.7 Code",
      "limit": { "context": 131072, "output": 32768 },
      "modalities": { "input": ["text", "image", "video"], "output": ["text"] }
    },
    "glm-5": {
      "name": "GLM-5",
      "limit": { "context": 300000, "output": 32768 },
      "modalities": { "input": ["text"], "output": ["text"] },
      "variants": {
        "thinking": { "chat_template_kwargs": { "enable_thinking": true, "clear_thinking": false } },
        "instruct": { "chat_template_kwargs": { "enable_thinking": false } }
      }
    },
    "deepseek-v4-flash": {
      "name": "DeepSeek V4 Flash",
      "limit": { "context": 1048576, "output": 32768 },
      "modalities": { "input": ["text"], "output": ["text"] },
      "variants": {
        "thinking": { "chat_template_kwargs": { "enable_thinking": true } },
        "instruct": { "chat_template_kwargs": { "enable_thinking": false } }
      }
    },
    "minimax-m2": {
      "name": "MiniMax M2",
      "limit": { "context": 204800, "output": 32768 },
      "modalities": { "input": ["text"], "output": ["text"] }
    }
  }
},
```

Close and re-open OpenCode. Use `/models` to select an NRP model and test the connection.
