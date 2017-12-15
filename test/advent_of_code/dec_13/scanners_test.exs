defmodule AdventOfCode.Scanners.PartOneTest do
  alias AdventOfCode.Scanners.PartOne, as: Scanners
  use ExUnit.Case

  describe "Scanners.severity/1" do
    test "it works for the sample input" do
      input = """
      0: 3
      1: 2
      4: 4
      6: 4
      """

      assert Scanners.severity(input) == 24
    end
  end
end

defmodule AdventOfCode.Scanners.PartTwoTest do
  alias AdventOfCode.Scanners.PartTwo, as: Scanners
  use ExUnit.Case

  describe "Scanners.delay/1" do
    test "it works for the sample input" do
      input = """
      0: 3
      1: 2
      4: 4
      6: 4
      """

      assert Scanners.delay(input) == 10
    end
  end
end
