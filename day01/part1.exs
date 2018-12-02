defmodule FrequencyFix do
  def correct do
    parse_input()
    |> Enum.reduce(0, fn(adjust_by, current) ->
      current + adjust_by
    end)
  end

  defp parse_input do
    "input.txt"
    |> File.read!
    |> String.trim
    |> String.split("\n")
    |> Enum.map(fn(str) -> Integer.parse(str) |> elem(0) end)
  end
end


IO.puts "Day01 - Part1"
IO.puts "\tAdjusted Frequency = #{FrequencyFix.correct()}"
