defmodule AdventOfCode.Captcha.PartOne do
  @moduledoc """
  You're standing in a room with "digitization quarantine" written in LEDs along
  one wall. The only door is locked, but it includes a small interface.
  "Restricted Area - Strictly No Digitized Users Allowed."

  It goes on to explain that you may only leave by solving a captcha to prove
  you're not a human. Apparently, you only get one millisecond to solve the
  captcha: too fast for a normal human, but it feels like hours to you.

  The captcha requires you to review a sequence of digits (your puzzle input)
  and find the sum of all digits that match the next digit in the list. The list
  is circular, so the digit after the last digit is the first digit in the list.
  """

  def solve(captcha) do
    # The problem specifies:
    #   > The list is circular, so the digit after the last digit
    #   > is the first digit in the list.
    # To simulate a this simple circular list behaviour, we append the first
    # character to the end of the list
    [first|_] = digits = Integer.digits(captcha)

    digits ++ [first]
    |> solve(0)
  end

  # ignore the last digit, it is the duplicate first digit we added
  # earlier
  defp solve([_], acc), do: acc

  defp solve([x,x|tail], acc) do
    solve([x|tail], acc + x)
  end

  defp solve([_|tail], acc), do: solve(tail, acc)
end

defmodule AdventOfCode.Captcha.PartTwo do
  @moduledoc """
  You notice a progress bar that jumps to 50% completion. Apparently, the door
  isn't yet satisfied, but it did emit a star as encouragement. The instructions
  change:

  Now, instead of considering the next digit, it wants you to consider the digit
  halfway around the circular list. That is, if your list contains 10 items,
  only include a digit in your sum if the digit 10/2 = 5 steps forward matches
  it. Fortunately, your list has an even number of elements.
  """

  def solve(captcha) do
    digits = Integer.digits(captcha)
    # For these captchas we need to more accurately simluate a circular list.
    # Given a captcha of length N, we know that we will always be comparing the
    # element at index X with the element at index X + N/2. To achieve this, we
    # can create a copy of the captcha and shift its elements around by N/2
    # places. We can then iterate over the two copies comparing the digits at
    # corresponding indices.
    shift_size = Enum.count(digits) |> Integer.floor_div(2)
    {tail, head} = Enum.split(digits, shift_size)
    solve(digits, head ++ tail, 0)
  end

  defp solve([], _, acc), do: acc
  defp solve([x|t1], [x|t2], acc), do: solve(t1, t2, acc + x)
  defp solve([_|t1], [_|t2], acc), do: solve(t1, t2, acc)
end
