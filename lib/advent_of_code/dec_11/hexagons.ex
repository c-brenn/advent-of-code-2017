defmodule AdventOfCode.Hexagons.PartOne do
  alias AdventOfCode.Hexagons

  def distance(steps) do
    steps
    |> String.split(",", trim: true)
    |> Enum.reduce(Hexagons.origin(), &Hexagons.step/2)
    |> Hexagons.manhattan_distance(Hexagons.origin())
  end
end

defmodule AdventOfCode.Hexagons.PartTwo do
  alias AdventOfCode.Hexagons

  def max_distance(steps) do
    steps
    |> String.split(",", trim: true)
    |> Enum.scan(Hexagons.origin(), &Hexagons.step/2)
    |> Enum.map(&Hexagons.manhattan_distance(Hexagons.origin(), &1))
    |> Enum.max()
  end
end

defmodule AdventOfCode.Hexagons do
  def origin, do: {0, 0, 0}

  def step("n", {x, y, z}), do: {x, y + 1, z - 1}
  def step("s", {x, y, z}), do: {x, y - 1, z + 1}
  def step("nw", {x, y, z}), do: {x - 1, y + 1, z}
  def step("se", {x, y, z}), do: {x + 1, y - 1, z}
  def step("ne", {x, y, z}), do: {x + 1, y, z - 1}
  def step("sw", {x, y, z}), do: {x - 1, y, z + 1}

  def manhattan_distance({x1, y1, z1}, {x2, y2, z2}) do
    [x1 - x2, y1 - y2, z1 - z2]
    |> Enum.map(&abs/1)
    |> Enum.max()
  end
end
