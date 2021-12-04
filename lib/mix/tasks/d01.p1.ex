defmodule Mix.Tasks.D01.P1 do
  use Mix.Task

  import AdventOfCode.Day01

  @shortdoc "Day 01 Part 1"
  def run(args) do
    input = AdventOfCode.Input.get!(1, 2021)

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_1: fn -> input |> part1() end}),
      else:
        input
        |> String.split("\n", trim: true)
        |> Enum.map(&String.to_integer/1)
        |> part1()
        |> IO.inspect(label: "Part 1 Results")
  end
end
