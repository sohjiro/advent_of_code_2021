defmodule AdventOfCode.Day01Test do
  use ExUnit.Case

  import AdventOfCode.Day01

  test "should convert input measurements into a tuple" do
    input = [199]
    result = process_measurements(input)
    assert [{199, :n_a}] == result

    input = [199, 200, 196]
    result = process_measurements(input)
    assert [{199, :n_a}, {200, :inc}, {196, :dec}] == result
  end

  test "should count amount of increases" do
    input = [{199, :n_a}]
    result = count_measure_incs(input)
    assert result == 0

    input = [{199, :n_a}, {200, :inc}]
    result = count_measure_incs(input)
    assert result == 1

    input = [{199, :n_a}, {200, :inc}, {196, :dec}]
    result = count_measure_incs(input)
    assert result == 1

    input = [{199, :n_a}, {200, :inc}, {196, :dec}, {220, :inc}]
    result = count_measure_incs(input)
    assert result == 2
  end

  test "Convert list to 3-size-tuples" do
    input = [199, 200]
    result = convert_list_into_tuples(input)
    assert Enum.empty?(result)

    input = [199, 200, 206]
    result = convert_list_into_tuples(input)
    assert Enum.take(tuple_results(), 1) == result

    input = [199, 200, 206, 210]
    result = convert_list_into_tuples(input)
    assert Enum.take(tuple_results(), 2) == result

    input = [199, 200, 206, 210, 200, 207]
    result = convert_list_into_tuples(input)
    assert tuple_results() == result
  end

  defp tuple_results do
    [
      [199, 200, 206],
      [200, 206, 210],
      [206, 210, 200],
      [210, 200, 207]
    ]
  end
end
