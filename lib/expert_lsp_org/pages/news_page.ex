defmodule ExpertLspOrg.NewsPage do
  use Tableau.Page,
    layout: ExpertLspOrg.PageLayout,
    permalink: "/news",
    title: "News"

  use ExpertLspOrg.Component

  def template(assigns) do
    temple do
      section class: "container mx-auto max-w-2xl" do
        div class: "font-sans mb-8 text-lg" do
          if @posts != [] do
            ul do
              li class: "ml-4 list-disc" do
                for post <- @posts do
                  span do
                    a href: post.permalink, class: "text-purple-500" do
                      post.title
                    end

                    span class: "inline-flex" do
                      span do: "("

                      span class: "italic" do
                        c &date/1, date: post.date
                      end

                      span do: ")"
                    end
                  end
                end
              end
            end
          else
            "No news yet..."
          end
        end
      end
    end
  end
end
