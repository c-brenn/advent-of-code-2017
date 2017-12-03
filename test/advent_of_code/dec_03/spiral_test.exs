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
