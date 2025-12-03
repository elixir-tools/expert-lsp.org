defmodule ExpertLspOrg.Icons do
  import Temple

  def menu(_assigns) do
    temple do
      svg xmlns: "http://www.w3.org/2000/svg",
          fill: "none",
          viewbox: "0 0 24 24",
          stroke_width: "1.5",
          stroke: "currentColor",
          class: "h-6 w-6" do
        path stroke_linecap: "round",
             stroke_linejoin: "round",
             d: "M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" do
        end
      end
    end
  end
end
