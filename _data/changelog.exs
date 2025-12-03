if File.exists?("_build/changelog.md") do
  File.read!("_build/changelog.md")
else
  %{body: page} =
    Req.get!("https://raw.githubusercontent.com/elixir-lang/expert/refs/heads/main/CHANGELOG.md")

  File.write!("_build/changelog.md", page)

  page
end
