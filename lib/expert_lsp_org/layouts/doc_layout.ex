defmodule ExpertLspOrg.DocLayout do
  use ExpertLspOrg.Component
  use Tableau.Layout, layout: ExpertLspOrg.DocNavLayout

  def template(assigns) do
    temple do
      article class: "page prose prose-invert mx-auto" do
        h1 do
          @page.title
        end

        section do
          render(@inner_content)
        end
      end
    end
  end
end
