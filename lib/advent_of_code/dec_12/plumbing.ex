defmodule AdventOfCode.Plumbing.PartOne do
  alias AdventOfCode.Plumbing.Graph

  def connected_to_zero(relationships) do
    relationships
    |> Graph.new()
    |> Graph.connected_to("0")
    |> MapSet.size()
  end
end

defmodule AdventOfCode.Plumbing.PartTwo do
  alias AdventOfCode.Plumbing.Graph

  def groups(relationships) do
    graph = Graph.new(relationships)
    vertices = Graph.vertices(graph)
    groups(vertices, graph)
  end

  defp groups(unseen, graph, acc \\ 0)
  defp groups([], _, acc), do: acc

  defp groups(unseen = [vertex | _], graph, acc) do
    graph
    |> Graph.connected_to(vertex)
    |> (&MapSet.difference(MapSet.new(unseen), &1)).()
    |> MapSet.to_list()
    |> groups(graph, acc + 1)
  end
end

defmodule AdventOfCode.Plumbing.Graph do
  def new(relationships) do
    relationships
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, ["<->", " ", ","], trim: true))
    |> Enum.reduce(%{}, &build/2)
  end

  def vertices(x), do: Map.keys(x)

  defp build([vertex | neighbours], relationships) do
    Enum.reduce(neighbours, relationships, fn neighbour, acc ->
      Map.update(acc, neighbour, MapSet.new([vertex]), &MapSet.put(&1, vertex))
    end)
  end

  def connected_to(graph, vertex, connected \\ MapSet.new()) do
    if MapSet.member?(connected, vertex) do
      connected
    else
      graph
      |> Map.get(vertex, MapSet.new())
      |> MapSet.to_list()
      |> Enum.reduce(MapSet.put(connected, vertex), &connected_to(graph, &1, &2))
    end
  end
end
