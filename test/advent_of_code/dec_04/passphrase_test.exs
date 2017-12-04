defmodule AdventOfCode.PassPhrase.PartOneTest do
  alias AdventOfCode.PassPhrase.PartOne, as: Passphrase
  use ExUnit.Case

  describe "Passphrase.valid?/1" do
    test "it works for the sample input" do
      assert Passphrase.valid?("aa bb cc dd ee")
      refute Passphrase.valid?("aa bb cc dd aa")
      assert Passphrase.valid?("aa bb cc dd aaa")
    end
  end
end

defmodule AdventOfCode.PassPhrase.PartTwoTest do
  alias AdventOfCode.PassPhrase.PartTwo, as: Passphrase
  use ExUnit.Case

  describe "Passphrase.valid?/1" do
    test "it works for the sample input" do
      assert Passphrase.valid?("abcde fghij")
      refute Passphrase.valid?("abcde xyz ecdab")
      assert Passphrase.valid?("a ab abc abd abf abj")
      assert Passphrase.valid?("iiii oiii ooii oooi oooo")
      refute Passphrase.valid?("oiii ioii iioi iiio")
    end
  end
end
