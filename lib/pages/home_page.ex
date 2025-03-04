defmodule ExpertLspOrg.HomePage do
  use ExpertLspOrg.Component

  use Tableau.Page,
    layout: ExpertLspOrg.RootLayout,
    permalink: "/"

  def template(_assigns) do
    temple do
      p do
        "hello, world!"
      end
    end
  end
end
