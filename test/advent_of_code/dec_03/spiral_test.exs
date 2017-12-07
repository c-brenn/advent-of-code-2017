defmodule AdventOfCode.Spiral.PartOneTest do
  alias AdventOfCode.Spiral.PartOne, as: Spiral
  use ExUnit.Case

  describe "Spiral.distance_to_center/1" do
    test "1 is the center of the spiral" do
      assert Spiral.distance_to_center(1) == 0
    end

    test "it gets the correct answer for other sample inputs" do
      assert Spiral.distance_to_center(12) == 3
      assert Spiral.distance_to_center(23) == 2
      assert Spiral.distance_to_center(49) == 6
      assert Spiral.distance_to_center(1024) == 31
    end
  end
end

defmodule AdventOfCode.Spiral.PartTwoTest do
  alias AdventOfCode.Spiral.PartTwo, as: Spiral
  use ExUnit.Case

  defp expected_value(1), do: 1
  defp expected_value(2), do: 1
  defp expected_value(3), do: 2
  defp expected_value(4), do: 4
  defp expected_value(5), do: 5

  describe "Spiral.value_at/2" do
    test "it behaves correctly for the sample input" do
      Spiral.spiral()
      |> Stream.take(5)
      |> Enum.to_list()
      |> Enum.zip(1..5)
      |> Enum.reduce(%{}, fn {coords, i}, map ->
           expected = expected_value(i)
           actual = Spiral.value_at(coords, map)
           assert actual == expected
           Map.put(map, coords, expected)
         end)
    end
  end

  describe "Spiral.larger_than/1" do
    test "it works as intended" do
      assert Spiral.larger_than(1) == 2
      assert Spiral.larger_than(2) == 4
      assert Spiral.larger_than(4) == 5
      assert Spiral.larger_than(5) == 10
      assert Spiral.larger_than(747) == 806
    end
  end
end
