import Config

config :tableau, :reloader,
  patterns: [
    ~r"^lib/.*.ex",
    ~r"^(_posts|_pages|_wip|_draft)/.*.md",
    ~r"^_data/.*.(yaml|json|toml)",
    ~r"^assets/.*.(css|js)"
  ]

config :web_dev_utils, :reload_log, true
# uncomment this if you use something like ngrok
# config :web_dev_utils, :reload_url, "'wss://' + location.host + '/ws'"

config :tableau, :assets, tailwind: {Tailwind, :install_and_run, [:default, ~w(--watch)]}

if mix_tailwind_path = System.get_env("MIX_TAILWIND_PATH") do
  config :tailwind, path: mix_tailwind_path
end

config :tableau, Tableau.PageExtension, dir: ["_pages", "_wip"]
config :tableau, Tableau.PostExtension, future: true, dir: ["_posts", "_drafts"]
