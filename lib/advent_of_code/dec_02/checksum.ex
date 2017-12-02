defmodule AdventOfCode.Checksum.PartOne do
  @moduledoc """
  As you walk through the door, a glowing humanoid shape yells in your
  direction. "You there! Your state appears to be idle. Come help us repair the
  corruption in this spreadsheet - if we take another millisecond, we'll have to
  display an hourglass cursor!"

  The spreadsheet consists of rows of apparently-random numbers. To make sure
  the recovery process is on the right track, they need you to calculate the
  spreadsheet's checksum. For each row, determine the difference between the
  largest value and the smallest value; the checksum is the sum of all of these
  differences.
  """

  def calculate(matrix_as_str) do
    matrix_as_str
    |> String.split("\n", trim: true)
    |> Enum.map(&calculate_row_checksum/1)
    |> Enum.sum()
  end

  defp calculate_row_checksum(row) do
    {min, max} =
      row
      |> String.split()
      |> Enum.map(&parse_int/1)
      |> Enum.min_max(fn -> {0, 0} end)

    max - min
  end

  defp parse_int(str) do
    {int, ""} = Integer.parse(str)
    int
  end
end

defmodule AdventOfCode.Checksum.PartTwo do
  @moduledoc """
  "Great work; looks like we're on the right track after all. Here's a star for
  your effort." However, the program seems a little worried. Can programs be
  worried?

  "Based on what we're seeing, it looks like all the User wanted is some
  information about the evenly divisible values in the spreadsheet.
  Unfortunately, none of us are equipped for that kind of calculation - most of
  us specialize in bitwise operations."

  It sounds like the goal is to find the only two numbers in each row where one
  evenly divides the other - that is, where the result of the division operation
  is a whole number. They would like you to find those numbers on each line,
  divide them, and add up each line's result.
  """

  def calculate(matrix_as_str) do
    matrix_as_str
    |> String.split("\n", trim: true)
    |> Enum.map(&calculate_row_checksum/1)
    |> Enum.sum()
  end

  defp calculate_row_checksum(row) do
    row
    |> String.split()
    |> Enum.map(&parse_int/1)
    |> Enum.sort()
    |> find_divisible_pair()
  end

  defp find_divisible_pair(sorted_row) do
    Enum.reduce_while(sorted_row, sorted_row, fn denominator, [_ | numerators] ->
      case Enum.find(numerators, &(rem(&1, denominator) == 0)) do
        nil ->
          {:cont, numerators}

        numerator ->
          {:halt, Integer.floor_div(numerator, denominator)}
      end
    end)
  end

  defp parse_int(str) do
    {int, ""} = Integer.parse(str)
    int
  end
end
