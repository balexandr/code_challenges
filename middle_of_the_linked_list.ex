defmodule MiddleOfTheLinkedList do
  @moduledoc """
  Intuition/Approach

  This was similar to another problem so I remembered to use recursion
  to traverse the struct, get the length and divide it by 2 to
  get the middle position. Then go through the list again and when
  the middle position number matches the iteration number stop and output the rest of the struct.

  At the time of this submission it had the fastest runtime and used the least amount of memory than
  other solutions

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

  Visible here: https://leetcode.com/problems/middle-of-the-linked-list/solutions/3697808/elixir-recursion-solution/
  """

  @doc """
  Function to figure out the middle of the struct and output the remainder
  """
  @spec middle_node(head :: ListNode.t | nil) :: ListNode.t | nil
  def middle_node(head) do
    if is_nil(head.next) do
      head
    else
      middle_pos =
        [head.val | head.next]
        |> traverse(0)
        |> div(2)

      head
      |> find_middle_node(middle_pos, 0)
    end
  end

  defp find_middle_node(next_node, middle_pos, acc) do
    if acc == middle_pos do
      next_node
    else
      find_middle_node(next_node.next, middle_pos, acc + 1)
    end
  end

  defp traverse([], acc), do: acc
  defp traverse([val | nil], acc), do: 1 + acc
  defp traverse([val | node], acc) do
    traverse([node.val | node.next], 1 + acc)
  end
end
