defmodule AdventOfCode.Plumbing.PartOneTest do
  alias AdventOfCode.Plumbing.PartOne, as: Plumbing
  use ExUnit.Case

  describe "Plumbing.connected_to_zero/1" do
    test "it works for the sample input" do
      input = """
      0 <-> 2
      1 <-> 1
      2 <-> 0, 3, 4
      3 <-> 2, 4
      4 <-> 2, 3, 6
      5 <-> 6
      6 <-> 4, 5
      """

      assert Plumbing.connected_to_zero(input) == 6
    end
  end
end

defmodule AdventOfCode.Plumbing.PartTwoTest do
  alias AdventOfCode.Plumbing.PartTwo, as: Plumbing
  use ExUnit.Case

  describe "Plumbing.groups/1" do
    test "it works for the sample input" do
      input = """
      0 <-> 2
      1 <-> 1
      2 <-> 0, 3, 4
      3 <-> 2, 4
      4 <-> 2, 3, 6
      5 <-> 6
      6 <-> 4, 5
      """

      assert Plumbing.groups(input) == 2
    end
  end
end
