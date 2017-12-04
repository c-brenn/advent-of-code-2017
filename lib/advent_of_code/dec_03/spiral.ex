defmodule AdventOfCode.Spiral.PartOne do
  require Integer

  def distance_to_center(1), do: 0
  def distance_to_center(n) do
    row_number = calculate_row_number(n)
    row_number + distance_to_center_of_row(n, row_number)
  end

  defp calculate_row_number(n) do
    ((:math.sqrt(n) - 1) / 2)
    |> Float.ceil()
    |> trunc()
  end

  defp distance_to_center_of_row(n, row_number) do
    row_length = 2 * row_number + 1
    max_in_layer = row_length * row_length
    distance_to_max_in_layer = max_in_layer - n
    distance_to_max_in_row = rem(distance_to_max_in_layer, row_length - 1)
    abs(distance_to_max_in_row - row_number)
  end
end

defmodule AdventOfCode.Spiral.PartTwo do
  def larger_than(n) do
    spiral()
    |> Enum.reduce_while(%{}, fn (coords, map) ->
      current = value_at(coords, map)
      if current > n do
        {:halt, current}
      else
        {:cont, Map.put(map, coords, current)}
      end
    end)
  end

  def value_at({0, 0}, _), do: 1
  def value_at(coords, map) do
    coords
    |> neighbours()
    |> Enum.map(&(Map.get(map, &1, 0)))
    |> Enum.sum()
  end

  defp neighbours(x) do
    [
      step(:right),
      step(:left),
      step(:up),
      step(:down),
      add_coords(step(:up), step(:right)),
      add_coords(step(:up), step(:left)),
      add_coords(step(:down), step(:right)),
      add_coords(step(:down), step(:left))
    ]
    |> Enum.map(&(add_coords(x, &1)))
  end

  @doc """
  We represent the spiral as (x, y) coordinates with 1 at the origin (0,0), 2 at
  (1, 0), 3 at (1, 1) and so on. We generate the sequence of coordinates that
  the spiral visits in order using the following method:

  Start at the origin, take 1 step right, turn left, take 1 step, turn left,
  take 2 steps, turn left, take 2 steps, turn left, take 3 steps ...

  We see that a pattern emerges:

  Take N steps, Turn left
  Take N steps, Turn left
  Take N + 1 steps, Turn left
  Take N + 1 steps, Turn left
  Take N + 2 steps, Turn left
  Take N + 2 steps, Turn left
  ...
  """
  def spiral do
    Stream.resource(
      &init_stream/0,
      &move/1,
      fn _ -> nil end
    )
  end

  defp init_stream() do
    {{0, 0}, 2, 1, 1, :right}
  end

  defp move({coords, 2, side_length, 0, direction}) do
    move({coords, 1, side_length, side_length, turn_left(direction)})
  end

  defp move({coords, 1, side_length, 0, direction}) do
    move({coords, 2, side_length + 1, side_length + 1, turn_left(direction)})
  end

  defp move({coords, sides_left, side_length, steps_left_in_side, direction}) do
    next_coords = add_coords(coords, step(direction))
    next_acc = {next_coords, sides_left, side_length, steps_left_in_side - 1, direction}
    {[coords], next_acc}
  end

  defp add_coords({x1, y1}, {x2, y2}), do: {x1 + x2, y1 + y2}

  defp turn_left(:right), do: :up
  defp turn_left(:left), do: :down
  defp turn_left(:up), do: :left
  defp turn_left(:down), do: :right

  defp step(:right), do: {1, 0}
  defp step(:left), do: {-1, 0}
  defp step(:up), do: {0, 1}
  defp step(:down), do: {0, -1}
end
