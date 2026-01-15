defmodule Knapsack do
  @doc """
  Return the maximum value that a knapsack can carry.
  """
  @spec maximum_value(items :: [%{value: integer, weight: integer}], maximum_weight :: integer) :: integer
  def maximum_value(items, maximum_weight), do: knapsack(items, maximum_weight, 0)

  # No items left
  defp knapsack([], _, memo), do: memo

  # Item too heavy
  defp knapsack([item | items], remaining_capacity, memo) when item.weight > remaining_capacity do
    knapsack(items, remaining_capacity, memo)
  end

  # Maxium between with and without the item
  defp knapsack([item | items], remaining_capacity, memo) do
    max(
      knapsack(items, remaining_capacity - item.weight, memo + item.value),
      knapsack(items, remaining_capacity, memo)
    )
  end
end
