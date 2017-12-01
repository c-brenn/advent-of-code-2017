defmodule AdventOfCode.CaptchaTest do
  alias AdventOfCode.Captcha
  use ExUnit.Case

  describe "AdventOfCode.Captcha.PartOne.solve/1" do
    test "it correctly solves simple captchas" do
      assert Captcha.PartOne.solve(1122) == 3
    end

    test "it correctly sums long consequtive sequences of digits" do
      assert Captcha.PartOne.solve(1111) == 4
    end

    test "it correctly simulates a circular list" do
      assert Captcha.PartOne.solve(91212129) == 9
    end
  end

  describe "AdventOfCode.Captcha.PartTwo.solve/1" do
    test "it correctly solves simple captchas with matching digits" do
      assert Captcha.PartTwo.solve(1212) == 6
    end

    test "it correctly solves simple captchas with no matching digits" do
      assert Captcha.PartTwo.solve(1221) == 0
    end

    test "it correctly solves more complex captchas" do
      assert Captcha.PartTwo.solve(123425) == 4
      assert Captcha.PartTwo.solve(123123) == 12
      assert Captcha.PartTwo.solve(12131415) == 4
    end
  end
end
