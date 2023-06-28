defmodule RansomeNote do
  @moduledoc """
  Intuition/Approach

  In order to do the comparsion my thought was to convert to a list then
  enumerate over the the magazine letters. Each time it appeared in the
  ransome note, remove it and then at the end if there were no remaining letters,
  then it could be written

  Visible here: https://leetcode.com/problems/ransom-note/solutions/3694077/elixir-enum-solution/
  """

  @doc """
  Function to determine if it's possible to use all magazine letters once
  to generate a ransom note
  """
  @spec can_construct(ransom_note :: String.t, magazine :: String.t) :: boolean
  def can_construct(ransom_note, magazine) do
    rans_letters = String.codepoints(ransom_note)
    mag_letters = String.codepoints(magazine)

    remaining_letters = Enum.reduce(mag_letters, rans_letters, fn letter, acc ->
      if Enum.member?(rans_letters, letter), do: acc -- [letter], else: acc
    end)

    length(remaining_letters) == 0
  end
end
