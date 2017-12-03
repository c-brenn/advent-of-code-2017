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
