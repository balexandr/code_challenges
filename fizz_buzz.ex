defmodule FizzBuzz do
  @moduledoc """
  Intuition/Approach

  Started out knowing I wanted to enumerate over the
  list witn an Enum.reduce() and the na simple case statment to generate
  the list. After submission I realize its about 100ms slower than the
  fastest one posted but in a real-world scenario I think this is readable and clean.

  Visible here: https://leetcode.com/problems/fizz-buzz/solutions/3694632/elixir-enum-reduce-solution/
  """

  @doc """
  Function that iternates through `n` numbers and generates a list
  that dictates which numbers are divisble by 5 and 3 with the words "Fizz" and "Buzz"
  """
  @spec fizz_buzz(n :: integer) :: [String.t]
  def fizz_buzz(n) do
    Enum.reduce(1..n, [], fn num, acc ->
      acc ++ [
        case {rem(num, 3), rem(num, 5)} do
          {0, 0} -> "FizzBuzz"
          {0, _} -> "Fizz"
          {_, 0} -> "Buzz"
          _ -> to_string(num)
        end
      ]
    end)
  end
end
