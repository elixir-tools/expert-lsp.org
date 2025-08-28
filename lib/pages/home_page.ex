defmodule ExpertLspOrg.HomePage do
  use Tableau.Page,
    layout: ExpertLspOrg.RootLayout,
    permalink: "/"

  import Temple

  def template(_assigns) do
    temple do
      h2 class: "font-fancy uppercase text-center mt-4 text-4xl md:text-6xl font-bold" do
        "Expert"
      end

      p class: "font-sans text-center mt-8 text-lg mb-8" do
        "Expert is the official language server implementation for the Elixir programming language."
      end

      p class: "font-sans mt-8 text-lg mb-8" do
        "This website is a work in progress! A proper documentation site is to follow. Please visit our GitHub project for more details and nightly builds!"
      end

      h2 class: "font-fancy uppercase mt-4 mb-4 text-2xl md:text-3xl font-bold" do
        "Source Code"
      end

      p class: "font-sans mt-8 text-lg mb-8" do
        "The soure code is available on"
        a class: "text-purple-500 hover:underline", href: "https://github.com/elixir-lang/expert" do
          "GitHub."
        end
      end

      h2 class: "font-fancy uppercase mt-4 mb-4 text-2xl md:text-3xl font-bold" do
        "Sponsors"
      end

      p class: "font-sans mt-8 text-lg mb-8" do
        "Full time work on Expert is graciously funded by our sponsors. If your company would like to donate, please reach out to"
        a class: "text-purple-500 hover:underline", href: "mailto:danj@erlef.org" do
          "Dan Jankowski"
        end
        "at the Erlang Ecosystem Foundation."
      end

      div class: "flex gap-4 flex-wrap" do
        img class: "h-[100px]", src: "./sponsors/fly.png"
        img class: "h-[100px]", src: "./sponsors/tauspace.png"
        img class: "h-[100px]", src: "./sponsors/river.png"
      end
    end
  end
end
