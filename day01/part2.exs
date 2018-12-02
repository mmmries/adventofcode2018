defmodule FrequencyFix do
  def correct do
    adjustments = parse_input()
    step(adjustments, 0, MapSet.new(), adjustments)
  end

  def step([], current, seen, list), do: step(list, current, seen, list)
  def step([adjustment | rest], current, seen, list) do
    next = current + adjustment
    case Enum.member?(seen, next) do
      true -> {:ok, next}
      false -> step(rest, next, MapSet.put(seen, next), list)
    end
  end

  defp parse_input do
    "input.txt"
    |> File.read!
    |> String.trim
    |> String.split("\n")
    |> Enum.map(fn(str) -> Integer.parse(str) |> elem(0) end)
  end
end


IO.puts "Day01 - Part2"
result = FrequencyFix.correct()
IO.puts "\tFirst Repeated Frequency = #{inspect(result)}"
