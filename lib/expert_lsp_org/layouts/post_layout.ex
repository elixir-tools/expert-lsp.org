defmodule ExpertLspOrg.PostLayout do
  use ExpertLspOrg.Component
  use Tableau.Layout, layout: ExpertLspOrg.PageLayout

  def template(assigns) do
    temple do
      article class: "container prose prose-invert" do
        p class: "italic" do
          c &date/1, date: @page.date
        end

        section do
          render(@inner_content)
        end
      end
    end
  end
end
