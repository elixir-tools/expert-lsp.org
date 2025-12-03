defmodule ExpertLspOrg.ChangelogPage do
  use Tableau.Page,
    layout: ExpertLspOrg.DocLayout,
    title: "CHANGELOG",
    section: "Getting Started",
    permalink: "/docs/changelog",
    order: 4

  use ExpertLspOrg.Component

  def template(assigns) do
    temple do
      MDEx.to_html!(@data["changelog"])
    end
  end
end
