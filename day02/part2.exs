defmodule WordDiffer do
  def closest_similarities(words) do
    Enum.reduce(words, [], fn(word, closest) ->
      find_closest(word, words, closest)
    end)
  end

  defp find_closest(_word, [], closest), do: closest
  defp find_closest(word, [next | rest], closest) do
    match = diff(word, next)
    cond do
      word == next                    -> find_closest(word, rest, closest)
      length(match) > length(closest) -> find_closest(word, rest, match)
      true                            -> find_closest(word, rest, closest)
    end
  end

  def diff(word1, word2) do
    diff(word1, word2, [])
  end
  def diff(<<>>, <<>>, matches) do
    matches
  end
  def diff(<< char, rest1 :: binary >>, << char, rest2 :: binary>>, matches) do
    diff(rest1, rest2, [char | matches])
  end
  def diff(<< _char1, rest1 :: binary>>, << _char2, rest2 :: binary>>, matches) do
    diff(rest1, rest2, matches)
  end

  def parse_input do
    "input.txt"
    |> File.read!
    |> String.trim
    |> String.split("\n")
  end
end

IO.puts "Day02 - Part2"
closest = WordDiffer.parse_input() |> WordDiffer.closest_similarities() |> Enum.reverse()
IO.puts "letters in common for most similar words: #{inspect(closest)}"
