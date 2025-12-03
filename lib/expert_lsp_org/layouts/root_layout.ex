defmodule ExpertLspOrg.RootLayout do
  use ExpertLspOrg.Component
  use Tableau.Layout

  def template(assigns) do
    temple do
      "<!DOCTYPE html>"

      html lang: "en", class: "scroll-p-[120px]" do
        head do
          meta charset: "utf-8"
          meta http_equiv: "X-UA-Compatible", content: "IE=edge"
          meta name: "viewport", content: "width=device-width, initial-scale=1.0"

          title do
            [@page[:title], "Expert"]
            |> Enum.filter(& &1)
            |> Enum.intersperse("|")
            |> Enum.join(" ")
          end

          link rel: "stylesheet", href: "/css/site.css"

          if Mix.env() == :prod do
            "<!-- Plausible Analytics -->"
            script defer: true, "data-domain": "expert-lsp.org", src: "/js/analytics.js"
            "<!-- / Plausible -->"
          end
        end

        body class: "bg-black text-white" do
          main class: "min-h-[100dvh] grid-rows-[auto_1fr_auto] grid-cols-[100%] mx-auto grid" do
            header class:
                     "border-b-1 sticky top-0 z-30 w-full border-white bg-black px-4 pb-6 lg:px-8" do
              div class: "container mx-auto mt-4 flex items-center justify-between " do
                div do
                  a href: "/" do
                    h2 class: "font-fancy text-2xl font-bold uppercase md:text-4xl" do
                      "Expert"
                    end
                  end
                end

                div class: "flex gap-4" do
                  button class: "block lg:hidden",
                         type: "button",
                         onclick: "sidebar.classList.toggle('hidden')" do
                    c &ExpertLspOrg.Icons.menu/1
                  end
                end
              end
            end

            div class: "h-full px-2" do
              render(@inner_content)
            end

            c &footer/1
          end

          if Mix.env() == :dev do
            c &Tableau.live_reload/1
          end
        end
      end
    end
  end

  def footer _assigns do
    temple do
      footer class: "my-8 text-center" do
        p class: "text-xs" do
          "built with"

          a href: "https://github.com/elixir-tools/tableau",
            target: "_blank",
            rel: "noreferrer",
            class: "italic" do
            "Tableau"
          end

          ","

          a href: "https://tailwindcss.com/",
            target: "_blank",
            rel: "noreferrer",
            class: "italic" do
            "TailwindCSS"
          end

          ", and"

          a href: "https://github.com/elixir-tools/expert-lsp.org",
            target: "_blank",
            rel: "noreferrer",
            class: "text-hacker italic text-red-500" do
            "♥"
          end
        end
      end
    end
  end
end
