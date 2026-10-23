# herdr-devnull-plugin

The original Herdr plugin for [/dev/null](https://dev-null.sh). It grew into
**[devnull-tui](https://github.com/arhen/devnull-tui)** — an unofficial terminal
UI for /dev/null that runs in any terminal, with or without Herdr.

This repository stays as the marketplace entry: `herdr plugin install
arhen/herdr-devnull-plugin` still works, and runs the current code from the new
repository (installing it on first use, from
`https://raw.githubusercontent.com/arhen/devnull-tui/main/install.sh`).

## Install

The plugin, from the new repository:

```sh
herdr plugin install arhen/devnull-tui
herdr server reload-config
```

The CLI, without Herdr:

```sh
npm install -g devnull-tui        # or bun, pnpm, npx
curl -fsSL https://raw.githubusercontent.com/arhen/devnull-tui/main/install.sh | sh
```

Either way the command is `devnull`. The plugin id is still `devnull.feed`, so
existing keybindings and actions keep working:

```toml
[[keys.command]]
key = "prefix+d"
type = "plugin_action"
command = "devnull.feed.open"
description = "open the /dev/null feed"
```

## Links

- Code, issues, docs: <https://github.com/arhen/devnull-tui>
- npm: <https://www.npmjs.com/package/devnull-tui>
- /dev/null: <https://dev-null.sh>

Unofficial: not affiliated with /dev/null. It reads the same pages the website
serves its guests.
