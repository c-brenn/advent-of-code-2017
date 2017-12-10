defmodule AdventOfCode.Registers.PartOne do
  alias AdventOfCode.Registers.{Executor, Parser}

  def run(program_src) do
    {:ok, ast} = Parser.parse(program_src)

    ast
    |> Enum.reduce(%{}, &Executor.exec/2)
    |> Enum.max_by(fn {_k, v} -> v end)
  end
end

defmodule AdventOfCode.Registers.PartTwo do
  alias AdventOfCode.Registers.{Executor, Parser}

  def run(program_src) do
    {:ok, ast} = Parser.parse(program_src)

    ast
    |> Enum.scan(%{}, &Executor.exec/2)
    |> Enum.map(&Enum.max_by(&1, fn {_k, v} -> v end, fn -> {:foo, 0} end))
    |> Enum.max_by(fn {_k, v} -> v end)
  end
end

defmodule AdventOfCode.Registers.Executor do
  def exec({{:ident, ident}, {:integer, offset}, condition}, registers) do
    if evaluate_condition(condition, registers) do
      Map.update(registers, ident, offset, &(&1 + offset))
    else
      registers
    end
  end

  defp evaluate_condition({operator, op_a, op_b}, registers) do
    args = [value_of(op_a, registers), value_of(op_b, registers)]
    Kernel.apply(Kernel, operator, args)
  end

  defp value_of({:integer, x}, _), do: x
  defp value_of({:ident, ident}, registers), do: Map.get(registers, ident, 0)
end

defmodule AdventOfCode.Registers.Parser do
  def parse(src) do
    src
    |> to_charlist()
    |> tokenize()
    |> generate_ast()
  end

  defp tokenize(src), do: :registers_lexer.string(src)

  defp generate_ast({:ok, tokens, _}), do: :registers_parser.parse(tokens)
  defp generate_ast({:error, reason, _}), do: {:error, reason}
end
