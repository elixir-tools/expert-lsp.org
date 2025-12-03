defmodule ExpertLspOrg.DocNavLayout do
  use ExpertLspOrg.Component
  use Tableau.Layout, layout: ExpertLspOrg.RootLayout

  @sections %{
    "Getting Started" => 1,
    "Features" => 2,
    "Extensions" => 3,
    "Help" => 4,
    "Development" => 5
  }

  def template(assigns) do
    docs =
      assigns.site.pages
      |> Enum.filter(&(&1.layout == ExpertLspOrg.DocLayout))
      |> Enum.group_by(& &1.section)
      |> Enum.map(fn {section, pages} ->
        {section,
         pages
         |> Enum.sort_by(& &1.order)}
      end)
      |> Enum.sort_by(fn {section, _} ->
        @sections[section]
      end)

    assigns = Map.put(assigns, :docs, docs)

    temple do
      c &sidebar/1 do
        slot :left do
          for {section_header, pages} <- @docs do
            div class: "mb-2 flex flex-col gap-2" do
              h3 class:
                   "font-fancy border-l-4 border-transparent pl-1 text-sm font-normal text-zinc-400" do
                section_header
              end

              ul class: "flex list-none flex-col gap-1" do
                for page <- pages do
                  li do
                    a class: [
                        "border-l-4 pl-1 no-underline": true,
                        "font-normal border-purple-400": page.permalink == @page.permalink,
                        "font-light border-transparent": page.permalink != @page.permalink
                      ],
                      href: "#{page.permalink}" do
                      page.title
                    end
                  end
                end
              end
            end
          end

          div class: "flex flex-col gap-2" do
            h3 class:
                 "font-fancy border-l-4 border-transparent pl-1 text-sm font-normal text-zinc-400" do
              "Site Navigation"
            end

            c &nav/1
          end
        end

        div class: "min-w-[16rem] hidden px-4 lg:block"

        div class: "w-full flex-1 overflow-auto lg:px-2" do
          div do
            render(@inner_content)
          end

          div class: "lg:px-4" do
            div class: "hidden", do: "footer"
          end
        end

        slot :right do
          if @page[:toc] not in [[], nil] do
            aside class: "px-4 pt-4" do
              h3 class: "font-fancy mb-2 text-sm font-normal text-zinc-400" do
                "On this page"
              end

              ul class: "flex list-none flex-col gap-2" do
                for {heading, _children} <- @page.toc do
                  li class: "m-0" do
                    a class: "font-light no-underline hover:underline",
                      href: "##{heading.anchor}" do
                      heading.text
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
