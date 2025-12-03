---
title: Installation
layout: ExpertLspOrg.DocLayout
section: Getting Started
order: 2
---

> [!caution] Work In Progress
> 
> Documentation is still a work in progress!

## Editor Extensions

Some extensions will manage Expert for you.

[Read more](/docs/editors).

## Package Managers

### Homebrew

> [!caution] In Progress
> 
> Expert is not yet published to Homebrew.

Not currently available in Homebrew. It will be added once we reach [v0.1](https://github.com/elixir-lang/expert/milestone/1).

### Mason

```
:MasonInstall expert
```

### Nix

#### Nixpkgs

> [!caution] In Progress
> 
> Expert is not yet published to Nixpkgs.

Not currently available in Nixpkgs. It will be added once we reach [v0.1](https://github.com/elixir-lang/expert/milestone/1).

#### Flake

We provide a flake that can be used.

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    expert.url = "github:elixir-lang/expert";
  };

  outputs = {
    self,
    nixpkgs,
    expert,
  }: let
    systems = [
      "x86_64-linux"
      "aarch64-darwin"
    ];
    forAllSystems = f:
      nixpkgs.lib.genAttrs systems (system:
        f {
          inherit system;
          pkgs = nixpkgs.legacyPackages.${system};
        });
  in {
    devShells = forAllSystems ({
      system,
      pkgs,
    }: {
      default = pkgs.mkShell {
        packages = with pkgs; [
          elixir_1_18
          erlang
          expert.packages.${system}.default
        ];
      };
    });
  };
}
```

#### beam-flakes

> [!caution] In Progress
> 
> Expert is not yet implemented in beam-flakes.

Not currently supported in [beam-flakes](https://github.com/elixir-tools/nix-beam-flakes).


## GitHub Releases

> [!caution]
> 
> These commands are oriented for *nix systems. For Windows, PRs are welcome to ensure they work!

You can easily install Expert with the [gh](https://github.com/cli/cli) CLI and save it somewhere on your machine.

```shell
# Linux AMD64
$ gh release download nightly \
  --pattern *linux_amd64 \
  --output ~/.local/bin/expert \
  --clobber \
  --repo elixir-lang/expert

# Apple Silicon
$ gh release download nightly \
  --pattern *darwin_arm64 \
  --output ~/.local/bin/expert \
  --clobber \
  --repo elixir-lang/expert

$ chmod +x ~/.bin/expert
```

You can also manually download the executable from the [releases](https://github.com/elixir-lang/expert/releases) page.

## Source

> [!caution]
> 
> These commands are oriented for *nix systems. For Windows, PRs are welcome to ensure they work!

> [!tip]
> 
> Expert uses [just](https://just.systems/man/en/). You can install it with your systems package manager.

Recipes for building from source are located in our [justfile](https://github.com/elixir-lang/expert/blob/main/justfile).

```shell
# Builds an executable for your OS and copies it into `~/.local/bin/`
$ just install
```


