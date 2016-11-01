defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    camelCaseString = String.replace(string, ~r/([A-Z])/, " \\g{1}")
    parsedString = String.split(camelCaseString, [" ", "-"], trim: true)

    abbreviateRec(parsedString, "")
  end

  defp abbreviateRec([], acc) do
    acc
  end

  defp abbreviateRec([word|rest], acc) do
    firstChar = String.at(word, 0)

    abbreviateRec(rest, acc <> String.upcase(firstChar))
  end
end
