defmodule AdventOfCode.Streams.PartOneTest do
  alias AdventOfCode.Streams.PartOne, as: Streams
  use ExUnit.Case

  describe "Streams.score/1" do
    test "it works for the sample inputs" do
      assert Streams.score("{}") == 1
      assert Streams.score("{{{}}}") == 6
      assert Streams.score("{{},{}}") == 5
      assert Streams.score("{{{},{},{{}}}}") == 16
      assert Streams.score("{<a>,<a>,<a>,<a>}") == 1
      assert Streams.score("{{<ab>},{<ab>},{<ab>},{<ab>}}") == 9
      assert Streams.score("{{<!!>},{<!!>},{<!!>},{<!!>}}") == 9
      assert Streams.score("{{<a!>},{<a!>},{<a!>},{<ab>}}") == 3
    end
  end
end

defmodule AdventOfCode.Streams.PartTwoTest do
  alias AdventOfCode.Streams.PartTwo, as: Streams
  use ExUnit.Case

  describe "Streams.score/1" do
    test "it works for the sample inputs" do
      assert Streams.score("{<>}") == 0
      assert Streams.score("{<random characters>}") == 17
      assert Streams.score("{<<<<>}") == 3
      assert Streams.score("{<{!>}>}") == 2
      assert Streams.score("{<!!>}") == 0
      assert Streams.score("{<!!!>>}") == 0
      assert Streams.score("{<{o\"i!a,<{i<a>}") == 10
    end
  end
end
