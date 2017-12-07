defmodule AdventOfCode.Reallocator.PartOneTest do
  alias AdventOfCode.Reallocator.PartOne, as: Reallocator
  use ExUnit.Case

  describe "Reallocator.debug/1" do
    test "it works for the sample input" do
      assert Reallocator.debug([0, 2, 7, 0]) == 5
    end
  end
end

defmodule AdventOfCode.Reallocator.PartTwoTest do
  alias AdventOfCode.Reallocator.PartTwo, as: Reallocator
  use ExUnit.Case

  describe "Reallocator.debug/1" do
    test "it works for the sample input" do
      assert Reallocator.debug([0, 2, 7, 0]) == 4
    end
  end
end
