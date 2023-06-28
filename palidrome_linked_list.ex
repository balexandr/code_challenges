defmodule PalindromeLinkedList do
  @moduledoc """
  Intuition/Approach

  At first I was contemplating using a Enum.reduce() but then realized I
  could use [head | tail] to traverse the list and store the values in acc.
  Then it was simply a comparison to Enum.reverse() to see if it
  matched and therefore was a palindrome.

  <- Code ->
  # Definition for singly-linked list.
  #
  # defmodule ListNode do
  #   @type t :: %__MODULE__{
  #           val: integer,
  #           next: ListNode.t() | nil
  #         }
  #   defstruct val: 0, next: nil
  # end
  """

  @doc """
  Function to traverse a struct and store it's value in a list then check
  it in reverse and see if it's a palindrome
  """
  @spec is_palindrome(head :: ListNode.t | nil) :: boolean
  def is_palindrome(head) do
    val_list = traverse([head.val | head.next], [])
    val_list == Enum.reverse(val_list)
  end

  defp traverse([], acc), do: acc
  defp traverse([val | nil], acc), do: [val] ++ acc
  defp traverse([val | node], acc) do
    traverse([node.val | node.next], [val] ++ acc)
  end
end
