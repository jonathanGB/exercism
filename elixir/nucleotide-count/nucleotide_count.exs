defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    unless Enum.member?(@nucleotides, nucleotide) do
      raise ArgumentError, message: "Given nucleotide is not valid"
    end

    count_rec(strand, nucleotide, 0)
  end

  defp count_rec([], _, count) do
    count
  end

  defp count_rec([char|tail], nucleotide, count) do
    unless Enum.member?(@nucleotides, char) do
      raise ArgumentError, message: "Strand contains a bad nucleotide"
    end

    cond do
      char == nucleotide ->
        count_rec(tail, nucleotide, count + 1)
      true ->
        count_rec(tail, nucleotide, count)
    end
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    histogram_rec(strand, %{?A => 0, ?T => 0, ?C => 0, ?G => 0})
  end

  defp histogram_rec([], map) do
    map
  end

  defp histogram_rec([char|tail], map) do
    unless Enum.member?(@nucleotides, char) do
      raise ArgumentError, message: "Strand contains a bad nucleotide"
    end

    newMap = Map.get_and_update(map, char, fn currValue ->
      {currValue, currValue + 1}
    end)

    histogram_rec(tail, elem(newMap, 1))
  end
end
