defmodule SingleNujmberTwo do
  @moduledoc """
  Intuition/Approach

  Once I found the Enum function that generates a Map with the frequency of
  an item in an enumerable the rest was easy. Just had to find the value that
  matched '1'

  Visible here: https://leetcode.com/problems/single-number-ii/solutions/3859057/elixir-enum-solution/
  """

  @doc """
  Take an array of integers and output the integer that only appears once
  """
  @spec single_number(nums :: [integer]) :: integer
  def single_number(nums) do
    nums
    |> Enum.frequencies()
    |> Enum.find(fn {_key, val} -> val == 1 end)
    |> elem(0)
  end
end
