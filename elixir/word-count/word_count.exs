defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    splitSentence = String.split(sentence, ~r{[,! _@#\$%&\*:\^]}, trim: true)

    countRec(splitSentence, %{})
  end

  defp countRec([], map) do
    map
  end

  defp countRec([word|rest], map) do
    updatedMap = Map.update(map, String.downcase(word), 1, &(&1 + 1))

    countRec(rest, updatedMap)
  end
end
