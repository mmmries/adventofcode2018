defmodule Checksum do
  def checksum do
    classified = parse_input()
                 |> Enum.map(&word_to_class/1)

    how_many_doubles = classified |> Enum.filter(&( Map.has_key?(&1, 2) )) |> Enum.count
    how_many_triples = classified |> Enum.filter(&( Map.has_key?(&1, 3) )) |> Enum.count

    how_many_doubles * how_many_triples
  end

  # "abcddd" => %{1 => true, 3 => true}
  def word_to_class(word) do
    word
    |> String.codepoints()
    |> Enum.group_by(&(&1))
    |> Enum.reduce(%{}, fn({_letter, instances}, map) ->
      Map.put(map, length(instances), true)
    end)
  end

  defp parse_input do
    "input.txt"
    |> File.read!
    |> String.trim
    |> String.split("\n")
  end
end

IO.puts "Day 02 - Part1"
IO.puts "Checksum: #{Checksum.checksum()}"
