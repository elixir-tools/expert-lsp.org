---
title: History
permalink: /history
layout: ExpertLspOrg.PageLayout
---

> [!note]
> 
> This story can be expanded to cover the entire history of Elixir editoring tooling. Please send a [PR](https://github.com/expert-lsp/expert-lsp.org) if you have something to add!

After 10+ years the Elixir language gained an official implementation of the [Language Server Protocol](https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/) (or LSP), **Expert**!

It started around 2014 when [Jake Becker](https://github.com/JakeBecker) created [ElixirLS](https://github.com/elixir-lsp/elixir-ls). It gained prominent adoption, and later on gained a maintenance team after Becker moved on from the project.

The project was primarily lead by [Łukasz Samson](https://github.com/lukaszsamson), who continued being a proper steward of the project, adding new features and fixing bugs with new Elixir and OTP releases.

Around 2022, both [Mitch Hanberg](https://github.com/mhanberg) and [Steve Cohen](https://github.com/scohen) independently decided they wanted to create a new LSP implementation for Elixir. Both had wanted to make drastic architecture changes that wouldn't really work with ElixirLS.

So, [Next LS](https://github.com/elixir-tools/next-ls) and [Lexical](https://github.com/lexical-lsp/lexical) were both born around 2023.

In 2024 the three maintainers partnered together and with the Elixir core team to focus efforts on a single official project, [Expert](https://github.com/elixir-lang/expert)! This marked the creation of the official Language Server Team, composed of Mitch, Łukasz, Steve, and [Jonatan Kłosko](https://github.com/jonatanklosko).

Mitch gave a presentation during the initial combination period at [CodeBeam America 2025](https://www.youtube.com/watch?v=2vIw2fb9DxA).

Expert is an amalgamation of Next LS and Lexical, taking innovations and architecture from each. Supplemented with features neither supported from [ElixirSense](https://github.com/elixir-lsp/elixir_sense), the library that powers much of the ElixirLS.

You can find Expert on [GitHub](https://github.com/elixir-lang/expert). 
