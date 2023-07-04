defmodule RichestCustomerWealth do
  @moduledoc """
  Intuition/Approach

  Similar to most list type challenges, I knew enumerating over the nest list and then
  utilizing `Enum.max()` was the solution.

  Visible here: https://leetcode.com/problems/richest-customer-wealth/solutions/3714954/elixir-enum-solution/
  """

  @doc """
  Function that takes a list of list and outputs the nested list thay has the highest sum
  """
  @spec maximum_wealth(accounts :: [[integer]]) :: integer
  def maximum_wealth(accounts) do
    accounts
    |> Enum.map(&Enum.sum(&1))
    |> Enum.max()
  end
end
