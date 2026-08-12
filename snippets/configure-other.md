

## Free providers


The OpenCode *provider*, gives you access to some free models - but with usage limits. You can add multiple free/paid providers to OpenCode and switch between them when one provider reaches its limit. This lets you keep working while another provider is unavailable, or if you have exhausted the limit of a paid subscription.

### Kilo AI

Kilo AI supports anonymous access, so you don't need to create an account or attach a payment method. Anonymous access is limited to [200 requests per hour per IP address](https://kilo.ai/docs/gateway/authentication#anonymous-access). 

Kilo also provides a "free model router": its router chooses a free model for each request, so you don't choose the model yourself. However, like OpenCode Zen's free models, these models are offered in exchange for using your data for model training, so don't send private or sensitive information.


To add Kilo AI to OpenCode, open the `opencode.json` configuration file described in [Setting up the OpenCode configuration file](#setting-up-the-opencode-configuration-file) and add this entry inside the `provider` object.


```json
"kilo-anon": {
  "npm": "@ai-sdk/openai-compatible",
  "name": "Kilo Anonymous",
  "options": {
    "baseURL": "https://api.kilo.ai/api/gateway"
  },
  "models": {
    "kilo-auto/free": {
      "name": "Kilo Auto Free"
    }
  }
},
```

Close and re-open OpenCode. Use `/models` to select `Kilo Auto Free` under the Kilo Anonymous provider, and send a test message to confirm that it works.


### OpenRouter

OpenRouter is a platform that aggregates multiple AI model providers. Its `openrouter/free` model routes each request to a free model that supports the input you provide. For example, if you paste an image, it selects a free model that supports image input. 

You can see which models are currently free in the [OpenRouter model listing](https://openrouter.ai/models/?q=free).

As with Kilo, OpenRouter may route your requests to providers that log prompts and outputs and use them to improve their services, e.g. for training. Do not submit personal or confidential data. You can configure your privacy settings at [https://openrouter.ai/settings/privacy](https://openrouter.ai/settings/privacy) - for example, you can disable the **Allow free endpoints that publish prompts** option. 

Unlike Kilo, OpenRouter does not support anonymous use, so you will have to create an account, although you do *not* have to attach any payment method. To use OpenRouter, go to [https://openrouter.ai/](https://openrouter.ai/) and sign up. You don't need to attach a payment method. Once you have an account, create an API key:

* click on your profile icon in the top right
* choose Settings
* choose API Keys
* and Create

Copy the key, and save it in a safe place. Then edit the `opencode.json` configuration file described in [Setting up the OpenCode configuration file](#setting-up-the-opencode-configuration-file).

> **Note**: If you use a project configuration file, add it to your `.gitignore`. The file will contain your OpenRouter API key and should not be added to your Git repository.

Add this entry inside the `provider` object, replacing `xxxxxxxxxxxxxx` with your API key.


```json
"openrouter": {
  "npm": "@ai-sdk/openai-compatible",
  "name": "OpenRouter",
  "options": {
    "baseURL": "https://openrouter.ai/api/v1",
    "apiKey": "xxxxxxxxxxxxxx"
  },
  "whitelist": [
    "openrouter/free"
  ],
  "models": {
    "openrouter/free": {
      "name": "OpenRouter Free"
    }
  }
},
```

Close and re-open OpenCode. Use `/models` to select `OpenRouter Free` under the OpenRouter provider. Free usage is subject to a rate limit of [50 requests per day](https://openrouter.ai/pricing).

### Github Copilot for Students

Verified students can use the free [GitHub Copilot Student](https://docs.github.com/en/copilot/how-tos/copilot-on-github/set-up-copilot/enable-copilot/set-up-for-students) plan. It includes unlimited code completions in VS Code, plus limited chat and agent usage.

Student plan users access models through automatic model selection, so you cannot choose a specific model in OpenCode.

To activate the student benefit:

1. Go to [GitHub Education benefits](https://github.com/settings/education/benefits).
2. If GitHub has not verified you as a student, choose **Start an application** and complete the verification process.
3. Under **Free GitHub developer resources for students and teachers**, choose **Learn more** and follow the prompts to activate Copilot Student.

After activating Copilot Student, connect it to OpenCode:

1. In the OpenCode TUI, type `/connect` and hit Enter.
2. Search for and choose **GitHub Copilot**.
3. Open [https://github.com/login/device](https://github.com/login/device) in your browser and enter the code OpenCode displays.
4. After authorization completes, use `/models` to select a GitHub Copilot model.

Copilot gives you a monthly allowance of usage. You can check how much of your allowance is exhausted, and when your usage resets, in your [billing settings](https://github.com/settings/billing).

### Google Gemini

Google provides a free tier for the Gemini API. To use it in OpenCode, create an API key in [Google AI Studio](https://aistudio.google.com/apikey).

1. Open the **API Keys** page and click **Create API key**.

   ![Google AI Studio API Keys page.](images/gemini-01-api-keys.png)

2. Create a Google Cloud project when Google AI Studio prompts you. The API key belongs to this project. 

   ![Google AI Studio showing that no Cloud projects are available.](images/gemini-02-no-cloud-projects.png)

   ![Google AI Studio project creation dialog.](images/gemini-03-create-project.png)

   ![Google AI Studio with the new project selected.](images/gemini-04-select-project.png)

   Note that an institutional Google account, such as a school account, may be restricted from creating Google Cloud projects.

3. Copy the API key. Then edit the `opencode.json` configuration file described in [Setting up the OpenCode configuration file](#setting-up-the-opencode-configuration-file). If you use a project configuration file, add it to your `.gitignore`. The file will contain your Gemini API key and should not be added to your Git repository.

4. Add this entry inside the `provider` object, replacing `xxxxxxxxxxxxxx` with your API key. This list includes the text-generation models from your rate-limit page with a positive free-tier RPD; it excludes embeddings, image-generation models, and Gemini 2.x models. 

   ```json
   "google": {
     "npm": "@ai-sdk/openai-compatible",
     "name": "Google Gemini",
     "options": {
       "baseURL": "https://generativelanguage.googleapis.com/v1beta/openai/",
       "apiKey": "xxxxxxxxxxxxxx"
     },
     "whitelist": [
       "gemini-3.6-flash",
       "gemini-3.5-flash",
       "gemini-3.5-flash-lite",
       "gemini-3-flash-preview",
       "gemini-3.1-flash-lite",
       "gemma-4-26b-it",
       "gemma-4-31b-it"
     ],
     "models": {
       "gemini-3.6-flash": {
         "name": "Gemini 3.6 Flash"
       },
       "gemini-3.5-flash": {
         "name": "Gemini 3.5 Flash"
       },
       "gemini-3.5-flash-lite": {
         "name": "Gemini 3.5 Flash Lite"
       },
       "gemini-3-flash-preview": {
         "name": "Gemini 3 Flash"
       },
       "gemini-3.1-flash-lite": {
         "name": "Gemini 3.1 Flash Lite"
       },
       "gemma-4-26b-it": {
         "name": "Gemma 4 26B"
       },
       "gemma-4-31b-it": {
         "name": "Gemma 4 31B"
       }
     }
   },
   ```

5. Close and re-open OpenCode. Use `/models` to select a model under the Google Gemini provider.

If your Google Cloud project has no billing account attached, your API requests stay on Google's free tier. If you attach billing, requests can incur charges. It is **very important** to set quotas and spending controls before creating an API key in a billed project!!! A compromised API key or an agent that makes excessive requests can otherwise create an extremely large bill which you would be personally responsible for.

You can check your usage and the rate limit for each model at [Google AI Studio's rate-limit page](https://aistudio.google.com/rate-limit?timeRange=last-28-days).

## Other paid providers

You can get really far with just those free providers! But if you already have a paid subscription to another AI provider, you can also use it in OpenCode.

### OpenAI ChatGPT

If you have a paid ChatGPT Plus/Pro subscription, you can connect it to OpenCode. 


1. In the OpenCode TUI, type `/connect` and hit Enter.
2. Search for and choose **OpenAI**.
3. Choose **ChatGPT Plus/Pro (browser)**. OpenCode will open your browser for authentication.
4. After authentication completes, use `/models` to select an OpenAI model.

> **Note**: If you are doing this on a "headless" server with no GUI, first go to [https://chatgpt.com/#settings/Security](https://chatgpt.com/#settings/Security) and make sure **Enable device code authorization for Codex** is turned on. Then choose **ChatGPT Pro/Plus (headless)**. Open [https://auth.openai.com/codex/device](https://auth.openai.com/codex/device) in your browser and enter the code OpenCode displays.

OpenAI applies 5-hour and weekly rate limits to your subscription. You can check how much of your allowance is exhausted, and when your usage resets, in the [usage analytics](https://chatgpt.com/codex/cloud/settings/analytics#usage).
