defmodule AdventOfCode.Checksum.PartOneTest do
  alias AdventOfCode.Checksum.PartOne, as: Checksum
  use ExUnit.Case

  describe "Checksum.calculate/1" do
    test "it calculates the correct checksum for the sample input" do
      input = """
      5 1 9 5
      7 5 3
      2 4 6 8
      """

      assert Checksum.calculate(input) == 18
    end
  end
end

defmodule AdventOfCode.Checksum.PartTwoTest do
  alias AdventOfCode.Checksum.PartTwo, as: Checksum
  use ExUnit.Case

  describe "Checksum.calculate/1" do
    test "it calculates the correct checksum for the sample input" do
      input = """
      5 9 2 8
      9 4 7 3
      3 8 6 5
      """

      assert Checksum.calculate(input) == 9
    end
  end
end
