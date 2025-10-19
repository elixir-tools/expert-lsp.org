# expert_lsp_org

The source code for https://expert-lsp.org.

Built with Tableau.

## Getting Started

```shell
# Setup
$ mix deps.get

# Start dev server on port 4999
$ mix tableau.server

# Build production site
$ MIX_ENV=prod mix build
```

### Nix

If you use Nix and Flakes, you can enter a development shell with `nix develop`.

## Adding pages

Pages can be created using code and templates with `Tableau.Page` or can be static markdown files in the `_pages` directory.

Tableau pages have the most flexibility, but markdown files are the most simple. The path to the markdown file will be used as the permalink if one isn't specified in the front matter.

This site uses [Temple](https://github.com/mhanberg/temple) for templating. It is an Elixir HTML DSL.

## Deployment

The site is deployed to Netlify automatically using GitHub Actions and the Netlify CLI.

This is necessary because Netlify build images do not always have the right version of Elixir and Erlang that we want to use, and this provides the most flexibility.

Branches will also deploy a staging deploy.
