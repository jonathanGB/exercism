defmodule Accumulate do
  @doc """
    Given a list and a function, apply the function to each list item and
    replace it with the function's return value.

    Returns a list.

    ## Examples

      iex> Accumulate.accumulate([], fn(x) -> x * 2 end)
      []

      iex> Accumulate.accumulate([1, 2, 3], fn(x) -> x * 2 end)
      [2, 4, 6]

  """

  @spec accumulate(list, (any -> any)) :: list
  def accumulate(list, fun) do
    accumulateRec(list, fun, [])
  end

  defp accumulateRec([], _, acc) do
    acc
  end

  defp accumulateRec([elem|rest], fun, acc) do
    newElem = fun.(elem)

    newAcc = List.insert_at(acc, -1, newElem)

    accumulateRec(rest, fun, newAcc)
  end
end
