defmodule MinimaxWorkshop do
  require Integer
  def score(node), do: score(node, 0)

  def score(node, level) do
    cond do
      is_nil(node.score) && Integer.is_even(level) ->
        Enum.max(Enum.map(node.children, &score(&1, level + 1)))

      is_nil(node.score) && Integer.is_odd(level) ->
        Enum.min(Enum.map(node.children, &score(&1, level + 1)))

      true ->
        node.score
    end
  end
end
