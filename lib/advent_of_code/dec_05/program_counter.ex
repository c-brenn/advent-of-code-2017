defmodule AdventOfCode.ProgramCounter.PartOne do
  def run(instructions) do
    run({[], instructions}, 0)
  end

  def run({_, []}, acc), do: acc

  def run({above, [current | below]}, acc) do
    move(current, above, [current + 1 | below])
    |> run(acc + 1)
  end

  def move(n, above, below) when n >= 0 do
    {below, above} = transfer_instructions(n, below, above)
    {above, below}
  end

  def move(n, above, below) do
    transfer_instructions(abs(n), above, below)
  end

  defp transfer_instructions(0, from, to), do: {from, to}
  defp transfer_instructions(_, [], _), do: {[], []}
  defp transfer_instructions(n, [h | from], to), do: transfer_instructions(n - 1, from, [h | to])
end

defmodule AdventOfCode.ProgramCounter.PartTwo do
  def run(instructions) do
    run({[], instructions}, 0)
  end

  def run({_, []}, acc), do: acc

  def run({above, [current | below]}, acc) do
    move(current, above, [update_instruction(current) | below])
    |> run(acc + 1)
  end

  defp update_instruction(n) when n >= 3, do: n - 1
  defp update_instruction(n), do: n + 1

  def move(n, above, below) when n >= 0 do
    {below, above} = transfer_instructions(n, below, above)
    {above, below}
  end

  def move(n, above, below) do
    transfer_instructions(abs(n), above, below)
  end

  defp transfer_instructions(0, from, to), do: {from, to}
  defp transfer_instructions(_, [], _), do: {[], []}
  defp transfer_instructions(n, [h | from], to), do: transfer_instructions(n - 1, from, [h | to])
end
