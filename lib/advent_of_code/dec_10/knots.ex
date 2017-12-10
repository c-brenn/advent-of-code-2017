defmodule AdventOfCode.Knots.PartOne do
  alias AdventOfCode.Knots.Hash

  def hash(lengths, list \\ 0..255) do
    acc = %{
      skip_length: 0,
      shifts: 0,
      list: list,
      list_length: Enum.count(list)
    }

    lengths
    |> Enum.reduce(acc, &Hash.twist/2)
    |> Hash.unshift()
    |> Map.get(:list)
    |> Enum.take(2)
    |> Enum.reduce(&Kernel.*/2)
  end
end

defmodule AdventOfCode.Knots.PartTwo do
  alias AdventOfCode.Knots.Hash
  use Bitwise

  @seed [17, 31, 73, 47, 23]
  @rounds 64

  def hash(base_lengths, list \\ 0..255) do
    base_lengths
    |> to_charlist()
    |> Kernel.++(@seed)
    |> do_hash(list)
    |> Hash.unshift()
    |> Map.get(:list)
    |> Enum.chunk_every(16)
    |> Enum.map(fn list -> Enum.reduce(list, &Bitwise.bxor/2) end)
    |> Enum.map(&Integer.to_string(&1, 16))
    |> Enum.map(&String.pad_leading(&1, 2, "0"))
    |> Enum.join()
    |> String.downcase()
  end

  def do_hash(lengths, list) do
    acc = %{
      skip_length: 0,
      shifts: 0,
      list: list,
      list_length: Enum.count(list)
    }

    Enum.reduce(1..@rounds, acc, fn _, hash ->
      Enum.reduce(lengths, hash, &Hash.twist/2)
    end)
  end
end

defmodule AdventOfCode.Knots.Hash do
  def twist(length, acc) do
    shifts = rem(length + acc.skip_length, acc.list_length)

    list =
      acc.list
      |> Enum.reverse_slice(0, length)
      |> shift(shifts)

    acc
    |> Map.update(:skip_length, 0, &(&1 + 1))
    |> Map.update(:shifts, 0, &(&1 + shifts))
    |> Map.put(:list, list)
  end

  defp shift(enum, count) do
    {tail, head} = Enum.split(enum, count)
    head ++ tail
  end

  def unshift(acc = %{list: list, shifts: shifts, list_length: length}) do
    Map.put(acc, :list, shift(list, length - rem(shifts, length)))
  end
end
