

## Installing OpenCode

OpenCode is open source software. It is developed and distributed at [https://github.com/anomalyco/opencode](https://github.com/anomalyco/opencode).

It is available for Windows, Mac, and Linux. Follow the OpenCode installation instructions for your specific platform: [https://opencode.ai/docs/#install](https://opencode.ai/docs/#install). 


## Learning OpenCode

Before launching `opencode`, navigate to the directory that you want to edit code in. (For example, a local copy of the repository you have cloned with `git clone`.) The default permissions allow `opencode` to modify files in the directory that it has been launched in; for file access outside that directory, it is supposed to ask for permission. (It is usually a good practice to *deny* permission for file access outside the designated directory, unless you are sure it is OK.)

Then, you should be able to launch it by running

```
opencode
```
in a terminal.

OpenCode itself comes with a rotating selection of free models through its [OpenCode Zen](https://opencode.ai/docs/zen/) provider. You can see which models are currently free on their [pricing page](https://opencode.ai/docs/zen/#pricing).

You don't need to create an account, let alone attach a payment method, to use these free models - however, 

* they are subject to a rate limit, which you will run into if using them heavily
* and, these models are offered for free in exchange for using your data for model training or other improvements. (See [privacy statement](https://opencode.ai/docs/zen/#privacy).)

In the OpenCode TUI, either

* type `/models` and hit Enter
* or Ctrl+X and then M 

to switch models.  Try chatting with a few different models.

OpenCode is primarily designed for command line use, so it's helpful to know a few keyboard shortcuts:

| Action | Shortcut |
|---|---|
| Insert a newline in the prompt without submitting | `Ctrl+J` |
| Submit the prompt | `Enter` |
| Open the general menu | `Ctrl+P` |
| Switch between Plan mode and Build mode | `Tab` |
| Switch models | `/models` or `Ctrl+X`, then `M` |
| Copy text | Your terminal's normal copy shortcut |
| Paste text | Your terminal's normal paste shortcut |

Copy and paste shortcuts are handled by your terminal, so they vary by platform. For example, many Linux terminals use `Ctrl+Shift+C` and `Ctrl+Shift+V`, while macOS terminals often use `Cmd+C` and `Cmd+V`.

If you *really* hate working at the command line, `opencode` *is* also available in a browser-based interface, if you start it with `opencode web`!


## Setting up the OpenCode configuration file

If you are just planning to work with these free OpenCode models, you won't need to configure anything else! But many users *will* want to configure other providers. To do so, you'll need to first set up your OpenCode configuration file.

You can use the global configuration file for your platform, or create an `opencode.json` in the project directory where you run OpenCode. See the [OpenCode configuration documentation](https://opencode.ai/docs/config/#locations) for the global file location. But, iff you create a project-level configuration file, it is *very* important to add it to `.gitignore`. Provider configuration files can contain API keys and should not be committed to Git.

Create an `opencode.json` with this starting content:

```json
{
  "$schema": "https://opencode.ai/config.json",
  "provider": {

  }
}
```

Each provider section below gives you an entry to add inside the `provider` object. You can add providers in any order or skip providers you do not need/intend to add.