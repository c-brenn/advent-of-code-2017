defmodule AdventOfCode.Knots.PartOneTest do
  alias AdventOfCode.Knots.PartOne, as: Knots
  use ExUnit.Case

  describe "Knots.hash/1" do
    test "it works for the sample input" do
      list = 0..4
      lengths = [3, 4, 1, 5]
      assert Knots.hash(lengths, list) == 12
    end
  end
end

defmodule AdventOfCode.Knots.PartTwoTest do
  alias AdventOfCode.Knots.PartTwo, as: Knots
  use ExUnit.Case

  describe "Knots.hash/1" do
    test "it works for the sample input" do
      assert Knots.hash("") == "a2582a3a0e66e6e86e3812dcb672a272"
      assert Knots.hash("AoC 2017") == "33efeb34ea91902bb2f59c9920caa6cd"
      assert Knots.hash("1,2,3") == "3efbe78a8d82f29979031a4aa0b16a9d"
      assert Knots.hash("1,2,4") == "63960835bcdc130f0b66d7ff4f6a5a8e"
    end
  end
end
