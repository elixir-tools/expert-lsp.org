defmodule ExpertLspOrg.TOCExtension do
  use Tableau.Extension, priority: 200, key: :toc, enabled: true

  @impl Tableau.Extension
  def pre_build(token) do
    posts =
      for post <- token.posts do
        toc = headings(post.body)

        Map.put(post, :toc, toc)
      end

    pages =
      for page <- token.pages do
        toc = headings(page.body)

        Map.put(page, :toc, toc)
      end

    {:ok, Map.put(token, :posts, posts) |> Map.put(:pages, pages)}
  end

  def headings(body) do
    {:ok, counters_pid} = Agent.start_link(fn -> Map.new() end)
    doc = MDEx.parse_document!(body)

    toc = scan_headings(counters_pid, List.wrap(doc[MDEx.Heading]))

    Agent.stop(counters_pid)

    toc
  end

  defp scan_headings(_counters, []) do
    []
  end

  defp scan_headings(counters_pid, headings) do
    [current | rest] = headings

    heading = textify(current)

    counters =
      Agent.get_and_update(counters_pid, fn c ->
        new = Map.update(c, heading, 0, &(&1 + 1))
        {new, new}
      end)

    anchor =
      if counters[heading] == 0 do
        heading
      else
        heading <> "-#{counters[heading]}"
      end
      |> MDEx.anchorize()

    node = %{text: heading, anchor: anchor}

    case Enum.split_while(rest, &(&1.level > current.level)) do
      {[], []} ->
        [{node, []}]

      {[], rest} ->
        [{node, []} | scan_headings(counters_pid, rest)]

      {rank, []} ->
        [{node, scan_headings(counters_pid, rank)}]

      {rank, rest} ->
        [{node, scan_headings(counters_pid, rank)} | scan_headings(counters_pid, rest)]
    end
  end

  defp textify(heading) do
    heading.nodes
    |> MDEx.Document.wrap()
    |> MDEx.to_html!()
  end
end
