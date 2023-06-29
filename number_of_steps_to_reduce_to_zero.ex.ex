defmodule NumberOfStepsToReduceToZero do
  @moduledoc """
  Intuition/Approach

  I felt dirty requiring Integer, but I know how helpful it is to use that built in function.
  I first started with trying to use Enum.reduce_while but it got clunky and required an Enumerable.
  Then it clicked to just use simple recursion and it ended up beating most of the other solution's runtime.

  Visible here: https://leetcode.com/problems/number-of-steps-to-reduce-a-number-to-zero/solutions/3698321/elixir-simple-recursion-solution/
  """

  require Integer

  @doc """
  Function that outputs the amount of math necessary to reduce the number to 0
  """
  @spec number_of_steps(num :: integer) :: integer
  def number_of_steps(num) do
    do_math(num, 0)
  end

  defp do_math(0, acc), do: acc
  defp do_math(num, acc) do
    num =
      if Integer.is_even(num) do
        div(num,2)
      else
        num - 1
      end
    acc = acc + 1
    do_math(num, acc)
  end
end
