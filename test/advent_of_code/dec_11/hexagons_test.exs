defmodule AdventOfCode.Hexagons.PartOneTest do
  alias AdventOfCode.Hexagons.PartOne, as: Hexagons
  use ExUnit.Case

  describe "Hexagons.distance/1" do
    test "it works for the sample inputs" do
      assert Hexagons.distance("ne,ne,ne") == 3
      assert Hexagons.distance("ne,ne,sw,sw") == 0
      assert Hexagons.distance("ne,ne,s,s") == 2
      assert Hexagons.distance("se,sw,se,sw,sw") == 3
    end
  end
end

defmodule AdventOfCode.Hexagons.PartTwoTest do
  alias AdventOfCode.Hexagons.PartTwo, as: Hexagons
  use ExUnit.Case

  describe "Hexagons.max_distance/1" do
    test "it works for the sample inputs" do
      assert Hexagons.max_distance("ne,ne,ne") == 3
      assert Hexagons.max_distance("ne,ne,sw,sw") == 2
      assert Hexagons.max_distance("n,n,s") == 2
    end
  end
end
