defmodule ExpertLspOrg.Component do
  use Temple.Component

  defmacro __using__(_) do
    quote do
      import Temple
      import unquote(__MODULE__)
    end
  end

  def date(assigns) do
    temple do
      span do
        Calendar.strftime(@date, "%b %d, %Y")
      end
    end
  end

  def sidebar(assigns) do
    temple do
      div class: "flex h-full" do
        div id: "sidebar",
            class:
              "max-h-[calc(100%-81px)] fixed z-20 hidden h-full w-full overflow-y-auto border-r border-zinc-950 bg-black px-4 pt-4 dark:border-white dark:bg-black lg:block lg:w-64" do
          aside do
            div class: "mb-4 flex flex-col gap-4" do
              slot @left
            end
          end
        end

        div class: "min-w-[16rem] hidden px-4 lg:block"

        div class: "h-full w-full flex-1 px-4 pt-8" do
          slot @inner_block
        end

        if assigns[:right] do
          aside class: "min-w-[16rem] hidden px-4 pt-4 xl:block" do
            div class: "max-h-[calc(100%-81px)] fixed h-full overflow-y-auto pr-2" do
              slot @right
            end
          end
        end
      end
    end
  end

  def nav(_assigns) do
    temple do
      div class: "flex flex-col gap-1 font-light" do
        a class: "m-0 block pl-2 hover:underline",
          href: "/" do
          "About"
        end

        a class: "m-0 block pl-2 hover:underline",
          href: "/docs/installation" do
          "Documentation"
        end

        a class: "m-0 block pl-2 hover:underline",
          href: "https://github.com/elixir-lang/expert" do
          "GitHub"
        end

        a class: "m-0 block pl-2 hover:underline",
          href: "/sponsors" do
          "Sponsor"
        end

        a class: "m-0 block pl-2 hover:underline",
          href: "/news" do
          "News"
        end
      end
    end
  end
end
