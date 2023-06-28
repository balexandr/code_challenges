@moduledoc """
Intuition/Approach

I knew I had to create the map and split the string, it got a bit trickier with
figuring out the 6 occurances where the numeral changes the number when its paired up and
wanted to keep it as readable as possible.

It seemed to use a bit more memory and run time than some others, but I found it easier to comprehend.

Visible here: https://leetcode.com/problems/roman-to-integer/solutions/3690666/elixir-readable-solution-w-regex/
"""

defmodule Solution do
  @numeral_to_int_map %{
      "I" => 1,
      "IV" => 4,
      "V" => 5,
      "IX" => 9,
      "X" => 10,
      "XL" => 40,
      "L" => 50,
      "XC" => 90,
      "C" => 100,
      "CD" => 400,
      "D" => 500,
      "CM" => 900,
      "M" => 1000
    }

  @doc """
  Function to convert Roman Numerals to it's integer value
  """
  @spec roman_to_int(s :: String.t) :: integer
  def roman_to_int(s) when is_binary(s) do
    if String.length(s) in 1..15 do
      split = Regex.scan(~r/#{regex_keys()}/, s)

      Enum.reduce(split, 0, fn numeral, acc ->
        acc + Map.get(@numeral_to_int_map, List.first(numeral))
      end)
    else
      0
    end
  end

  def roman_to_int(s), do: "Not a valid Roman Numeral"

  defp regex_keys() do
    @numeral_to_int_map
    |> Map.keys()
    |> Enum.sort_by(&-String.length(&1))
    |> Enum.join("|")
  end
end
