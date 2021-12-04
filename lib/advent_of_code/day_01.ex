defmodule AdventOfCode.Day01 do
  def part1(args) do
    args
    |> process_measurements()
    |> count_measure_incs()
  end

  def part2(args) do
  end

  def process_measurements(input) do
    input
    |> Stream.with_index()
    |> Enum.map(&convert_measure(&1, input))
  end

  def convert_list_into_tuples(measurements) do
    generate_tuples(measurements, [])
  end

  def count_measure_incs(input) do
    Enum.count(input, fn {_measure, value} -> value == :inc end)
  end

  defp convert_measure({value, 0}, _input), do: {value, :n_a}

  defp convert_measure({current_measure, index}, input) do
    last_measure = Enum.at(input, index - 1)
    result = compare_measure(current_measure, last_measure)
    {current_measure, result}
  end

  defp compare_measure(current_measure, last_measure) do
    cond do
      current_measure > last_measure -> :inc
      current_measure < last_measure -> :dec
      true -> :equal
    end
  end

  defp generate_tuples([x, y, z | rest], acc) do
    generate_tuples([y, z | rest], [[x, y, z] | acc])
  end

  defp generate_tuples(_, acc), do: Enum.reverse(acc)
end
