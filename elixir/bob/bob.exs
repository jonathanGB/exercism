defmodule Bob do
  def hey(input) do
    trimmedInput = String.trim(input)

    cond do
      String.last(trimmedInput) == "?" -> "Sure."
      trimmedInput == "" -> "Fine. Be that way!"
      String.upcase(trimmedInput) == trimmedInput && Regex.match?(~r/\p{Lu}/u, trimmedInput) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
