defmodule ExpertLspOrg.PostLayout do
  use ExpertLspOrg.Component
  use Tableau.Layout, layout: ExpertLspOrg.RootLayout

  def template(assigns) do
    temple do
      render(@inner_content)
    end
  end
end

