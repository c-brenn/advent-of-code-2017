defmodule AdventOfCode.PassPhrase.PartOne do
  def valid?(passphrase) do
    words =
      passphrase
      |> String.split()
    unique_words = Enum.uniq(words)
    Enum.count(words) == Enum.count(unique_words)
  end
end

defmodule AdventOfCode.PassPhrase.PartTwo do
  def valid?(passphrase) do
    words =
      passphrase
      |> String.split()
      |> Enum.map(&normalise/1)
    unique_words = Enum.uniq(words)
    Enum.count(words) == Enum.count(unique_words)
  end

  defp normalise(word) do
    word
    |> String.to_charlist()
    |> Enum.sort()
    |> to_string()
  end
end
