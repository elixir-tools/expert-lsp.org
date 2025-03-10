defmodule ExpertLspOrg.RootLayout do
  use ExpertLspOrg.Component
  use Tableau.Layout

  def template(assigns) do
    temple do
      "<!DOCTYPE html>"

      html lang: "en" do
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
          main class: "container h-[100dvh] px-4 mx-auto flex flex-col" do
            div class: "h-full flex-1" do
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
      footer class: "text-center my-8" do
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
