defmodule AdventOfCode.Scanners.PartOne do
  alias AdventOfCode.Scanners

  def severity(input) do
    input
    |> Scanners.new()
    |> calculate_severity()
  end

  defp calculate_severity(scanners, t \\ 0, score \\ 0)
  defp calculate_severity(%{max_depth: max}, t, score) when t > max, do: score

  defp calculate_severity(state = %{scanners: scanners}, t, severity) do
    range = Map.get(scanners, t, :no_scanner)

    delta =
      if Scanners.caught?(range, t) do
        t * range
      else
        0
      end

    calculate_severity(state, t + 1, severity + delta)
  end
end

defmodule AdventOfCode.Scanners.PartTwo do
  alias AdventOfCode.Scanners

  def delay(input) do
    scanners = Scanners.new(input)

    Stream.iterate(0, &(&1 + 1))
    |> Enum.find(&never_caught(scanners, &1))
  end

  defp never_caught(%{max_depth: d, scanners: scanners}, delay) do
    start_t = delay
    end_t = delay + d

    start_t..end_t
    |> Enum.with_index()
    |> Enum.all?(fn {t, index} ->
         range = Map.get(scanners, index, :no_scanner)
         !Scanners.caught?(range, t)
       end)
  end
end

defmodule AdventOfCode.Scanners do
  def new(input) do
    values =
      input
      |> String.split("\n", trim: true)
      |> Enum.map(&String.split(&1, ": ", parts: 2))
      |> Enum.map(fn [depth_str, range_str] ->
           {depth, _} = Integer.parse(depth_str)
           {range, _} = Integer.parse(range_str)
           {depth, range}
         end)

    {max_depth, _} = Enum.max_by(values, fn {x, _} -> x end)
    %{max_depth: max_depth, scanners: Map.new(values)}
  end

  def caught?(:no_scanner, _), do: false

  def caught?(range, time) do
    rem(time, 2 * range - 2) == 0
  end
end
