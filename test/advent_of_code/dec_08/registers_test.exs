defmodule AdventOfCode.Registers.PartOneTest do
  alias AdventOfCode.Registers.PartOne, as: Registers
  use ExUnit.Case

  describe "Registers.run/1" do
    test "it works for the sample input" do
      input = """
      b inc 5 if a > 1
      a inc 1 if b < 5
      c dec -10 if a >= 1
      c inc -20 if c == 10
      """

      assert Registers.run(input) == {'a', 1}
    end
  end
end

defmodule AdventOfCode.Registers.PartTwoTest do
  alias AdventOfCode.Registers.PartTwo, as: Registers
  use ExUnit.Case

  describe "Registers.run/1" do
    test "it works for the sample input" do
      input = """
      b inc 5 if a > 1
      a inc 1 if b < 5
      c dec -10 if a >= 1
      c inc -20 if c == 10
      """

      assert Registers.run(input) == {'c', 10}
    end
  end
end
