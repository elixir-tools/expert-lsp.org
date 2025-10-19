defmodule ExpertLspOrg.PageLayout do
  use ExpertLspOrg.Component
  use Tableau.Layout, layout: ExpertLspOrg.RootLayout

  def template(assigns) do
    temple do
      c &sidebar/1 do
        slot :left do
          c &nav/1
        end

        article class: "page container prose prose-invert mx-auto max-w-2xl" do
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
end
