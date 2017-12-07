defmodule AdventOfCode.ProgramCounter.PartOneTest do
  alias AdventOfCode.ProgramCounter.PartOne, as: ProgramCounter
  use ExUnit.Case

  describe "ProgramCounter.run/1" do
    test "it works for the sample input" do
      input = [0, 3, 0, 1, -3]
      assert ProgramCounter.run(input) == 5
    end
  end
end

defmodule AdventOfCode.ProgramCounter.PartTwoTest do
  alias AdventOfCode.ProgramCounter.PartTwo, as: ProgramCounter
  use ExUnit.Case

  describe "ProgramCounter.run/1" do
    test "it works for the sample input" do
      input = [0, 3, 0, 1, -3]
      assert ProgramCounter.run(input) == 10
    end
  end
end
