---
title: Editors
layout: ExpertLspOrg.DocLayout
section: Getting Started
order: 3
---

## Visual Studio Code

> [!caution] In Progress
> 
> This extension is not yet published to the marketplace.

[expert-lsp/vscode-expert](https://github.com/expert-lsp/vsode-expert) is the official Visual Studio Code extension.

**The extension is not yet stable and is not yet published to the extension marketplaces.**

The extension will take care of installing the Expert for you if you wish.

## Neovim

### elixir-tools.nvim

> [!caution] In Progress
> 
> This plugin does not yet support Expert

> [!caution]
> 
> If you are using a Neovim distribution like [LunarVim](https://www.lunarvim.org/), [AstroVim](https://astronvim.com/), or [NVChad](https://nvchad.com/), please make sure to disable any Elixir LSP support that comes out of the box, as it will interfere with `elixir-tools.nvim`.

There is no "official" plugin for Neovim, but the [elixir-tools.nvim]() plugin was created and is maintained by an Expert core team member.

**Expert support in elixir-tools.nvim is still in progress.**

The plugin will take care of installing the Expert for you if you wish.

### nvim-lspconfig

[nvim-lspconfig]() supports Expert.

```lua
vim.lsp.enable "expert"
```

## Zed

Expert is managed by the first party Zed [Elixir Extension](https://github.com/zed-extensions/elixir/tree/main).

Head to the Zed documentation to [learn more about installing extensions](https://zed.dev/docs/extensions/installing-extensions).

## Helix

## Helix

Add the following config to your `~/.config/helix/languages.toml`.

```toml
[[language]]
name = "elixir"
scope = "source.elixir"
language-server = { command = "path/to/expert", args = ["--stdio=true"] }
```

If you are using the latest git version of helix use this:

```toml
[[language]]
name = "elixir"
scope = "source.elixir"
language-servers = ["expert"]

[language-server.nextls]
command = "path/to/expert"
args = ["--stdio=true"]
```

## Emacs

> [!warning] TODO

## Sublime

> [!warning] TODO
