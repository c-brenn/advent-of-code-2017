defmodule AdventOfCode.Streams.PartOne do
  alias AdventOfCode.Streams.Parser

  def score(stream) do
    {:ok, ast} = Parser.parse(stream)
    do_score(ast, 1)
  end

  defp do_score({:garbage, _}, _), do: 0
  defp do_score({:group, []}, depth), do: depth

  defp do_score({:group, children}, depth) do
    children
    |> Enum.map(&do_score(&1, depth + 1))
    |> Enum.sum()
    |> Kernel.+(depth)
  end
end

defmodule AdventOfCode.Streams.PartTwo do
  alias AdventOfCode.Streams.Parser

  def score(stream) do
    {:ok, ast} = Parser.parse(stream)
    do_score(ast)
  end

  defp do_score({:garbage, length}), do: length

  defp do_score({:group, children}) do
    children
    |> Enum.map(&do_score/1)
    |> Enum.sum()
  end
end

defmodule AdventOfCode.Streams.Parser do
  def parse(src) do
    src
    |> to_charlist()
    |> tokenize()
    |> generate_ast()
  end

  defp tokenize(src), do: :stream_lexer.string(src)

  defp generate_ast({:ok, tokens, _}), do: :stream_parser.parse(tokens)
  defp generate_ast({:error, reason, _}), do: {:error, reason}
end
