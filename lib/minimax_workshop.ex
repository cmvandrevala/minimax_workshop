defmodule MinimaxWorkshop do
  def score(node) do
    if node.score == nil do
      score(List.first(node.children))
    else
      node.score
    end
  end
end
