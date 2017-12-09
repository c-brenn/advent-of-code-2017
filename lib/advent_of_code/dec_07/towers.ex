defmodule AdventOfCode.Towers.PartOne do
  def root(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse/1)
    |> find_root()
  end

  defp parse(line) do
    [name, _] = String.split(line, " ", parts: 2)
    children = find_children(line)
    %{name: name, children: children}
  end

  defp find_children(line) when is_binary(line) do
    case String.split(line, "->", parts: 2) do
      [_] ->
        []

      [_, children_str] ->
        children_str
        |> String.split([",", " "], trim: true)
    end
  end

  defp find_root(nodes) do
    names =
      nodes
      |> Enum.map(& &1.name)
      |> MapSet.new()

    children =
      nodes
      |> Enum.flat_map(& &1.children)
      |> MapSet.new()

    [root] =
      names
      |> MapSet.difference(children)
      |> MapSet.to_list()

    root
  end
end

defmodule AdventOfCode.Towers.PartTwo do
  def balance(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.into(%{}, &parse/1)
    |> calculate_weights()
    |> find_imbalanced_node()
    |> calculate_target_weight()
  end

  defp parse(line) do
    [name, _] = String.split(line, " ", parts: 2)

    [_, weight_str | _] = String.split(line, ["(", ")"], parts: 3)
    {weight, ""} = Integer.parse(weight_str)

    children = find_children(line)

    {name, %{weight: weight, children: children}}
  end

  defp find_children(line) when is_binary(line) do
    case String.split(line, "->", parts: 2) do
      [_] ->
        []

      [_, children_str] ->
        children_str
        |> String.split(",")
        |> Enum.map(&String.replace(&1, " ", ""))
    end
  end

  defp calculate_weights(nodes) do
    Enum.reduce(nodes, nodes, fn {name, node}, acc ->
      {weight, acc} = children_weight(node, acc)
      put_in(acc, [name, :children_weight], weight)
    end)
  end

  defp children_weight(%{children: []}, nodes), do: {0, nodes}

  defp children_weight(node, nodes) do
    Enum.reduce(node.children, {0, nodes}, fn child_name, {acc, memo} ->
      child = Map.get(memo, child_name)

      case get_in(nodes, [child_name, :children_weight]) do
        nil ->
          {children_weight, memo} = children_weight(child, memo)
          new_memo = put_in(memo, [child_name, :children_weight], children_weight)
          {acc + child.weight + children_weight, new_memo}

        children_weight ->
          {acc + child.weight + children_weight, memo}
      end
    end)
  end

  defp find_imbalanced_node(nodes) do
    {name, _} =
      Enum.find(nodes, fn {_, node} ->
        !balanced?(node, nodes) && Enum.all?(node.children, &balanced?(Map.get(nodes, &1), nodes))
      end)

    {name, nodes}
  end

  defp balanced?(%{children: []}, _), do: true

  defp balanced?(node, nodes) do
    [target | tail] =
      Enum.map(node.children, fn child_name ->
        child = Map.get(nodes, child_name)
        child.weight + child.children_weight
      end)

    Enum.all?(tail, &(&1 == target))
  end

  defp calculate_target_weight({imbalanced_node_name, nodes}) do
    %{children: children} = Map.get(nodes, imbalanced_node_name)

    {correct_node, incorrect_node} =
      children
      |> Enum.map(&Map.get(nodes, &1))
      |> Enum.min_max_by(&(&1.weight + &1.children_weight))

    delta =
      incorrect_node.weight + incorrect_node.children_weight -
        (correct_node.weight + correct_node.children_weight)

    incorrect_node.weight - delta
  end
end
