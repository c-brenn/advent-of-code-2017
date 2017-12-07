defmodule AdventOfCode.Reallocator.PartOne do
  def debug(banks_list) do
    banks =
      banks_list
      |> Enum.with_index()
      |> Map.new(fn {val, key} -> {key, val} end)

    bank_keys = Map.keys(banks)
    debug(banks, bank_keys, MapSet.new(), 0)
  end

  def debug(banks, keys, history, count) do
    if MapSet.member?(history, banks) do
      count
    else
      banks
      |> redistribute(keys)
      |> debug(keys, MapSet.put(history, banks), count + 1)
    end
  end

  def redistribute(banks, keys) do
    {max_key, max_value} = Enum.max_by(banks, fn {_key, val} -> val end)
    {tail, head} = Enum.split(keys, max_key + 1)

    Stream.cycle(head ++ tail)
    |> Stream.take(max_value)
    |> Enum.reduce(Map.put(banks, max_key, 0), fn key, acc ->
         Map.update(acc, key, 0, &(&1 + 1))
       end)
  end
end

defmodule AdventOfCode.Reallocator.PartTwo do
  def debug(banks_list) do
    banks =
      banks_list
      |> Enum.with_index()
      |> Map.new(fn {val, key} -> {key, val} end)

    bank_keys = Map.keys(banks)
    debug(banks, bank_keys, %{}, 0)
  end

  def debug(banks, keys, history, count) do
    if Map.has_key?(history, banks) do
      count - Map.get(history, banks)
    else
      banks
      |> redistribute(keys)
      |> debug(keys, Map.put(history, banks, count), count + 1)
    end
  end

  def redistribute(banks, keys) do
    {max_key, max_value} = Enum.max_by(banks, fn {_key, val} -> val end)
    {tail, head} = Enum.split(keys, max_key + 1)

    Stream.cycle(head ++ tail)
    |> Stream.take(max_value)
    |> Enum.reduce(Map.put(banks, max_key, 0), fn key, acc ->
         Map.update(acc, key, 0, &(&1 + 1))
       end)
  end
end
