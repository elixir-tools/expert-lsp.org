defmodule ExpertLspOrg.HomePage do
  use Tableau.Page,
    layout: ExpertLspOrg.RootLayout,
    permalink: "/"

  import Temple

  def template(_assigns) do
    temple do
      h2 class: "font-fancy uppercase text-center mt-4 text-4xl md:text-6xl font-bold",
         do: "Coming Soon"

      p class: "font-sans text-center mt-8 text-lg" do
        "ElixirLS + Next LS + Lexical"
      end
    end
  end
end
