defmodule AdventOfCode.Towers.PartOneTest do
  alias AdventOfCode.Towers.PartOne, as: Towers
  use ExUnit.Case

  describe "Towers.root/1" do
    test "it works for the sample input" do
      input = """
      pbga (66)
      xhth (57)
      ebii (61)
      havc (66)
      ktlj (57)
      fwft (72) -> ktlj, cntj, xhth
      qoyq (66)
      padx (45) -> pbga, havc, qoyq
      tknk (41) -> ugml, padx, fwft
      jptl (61)
      ugml (68) -> gyxo, ebii, jptl
      gyxo (61)
      cntj (57)
      """

      assert Towers.root(input) == "tknk"
    end
  end
end

defmodule AdventOfCode.Towers.PartTwoTest do
  alias AdventOfCode.Towers.PartTwo, as: Towers
  use ExUnit.Case

  describe "Towers.balance/1" do
    test "it works for the sample input" do
      input = """
      pbga (66)
      xhth (57)
      ebii (61)
      havc (66)
      ktlj (57)
      fwft (72) -> ktlj, cntj, xhth
      qoyq (66)
      padx (45) -> pbga, havc, qoyq
      tknk (41) -> ugml, padx, fwft
      jptl (61)
      ugml (68) -> gyxo, ebii, jptl
      gyxo (61)
      cntj (57)
      """

      assert Towers.balance(input) == 60
    end
  end
end
