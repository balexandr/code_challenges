defmodule TheKWeakestRowsInAMatrix do
  @moduledoc """
  Intuition/Approach

  When faced with this problem I knew setting the index then a simple sort and take would be the solution.
  This one was all about making it clean.

  Visible here: https://leetcode.com/problems/the-k-weakest-rows-in-a-matrix/solutions/3698245/elixir-pipeline-solution/
  """

  @doc """
  Fuction that sorts a list of lists, grabs the number necessary `k`
  and outputs their index
  """
  @spec k_weakest_rows(mat :: [[integer]], k :: integer) :: [integer]
  def k_weakest_rows(mat, k) do
    mat
    |> Enum.with_index()
    |> Enum.sort()
    |> Enum.take(k)
    |> Enum.map(fn {_, num} -> num end)
  end
end
