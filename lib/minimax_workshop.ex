defmodule MinimaxWorkshop do
  def score(node) do
    if node.score == nil do
      maximize(List.first(node.children))
    else
      node.score
    end
  end

  # We introduce some duplication here to separate the differing behaviours between max and min

  defp maximize(node) do
    if node.score == nil do
      minimize(List.first(node.children))
    else
      node.score
    end
  end

  defp minimize(node) do
    if node.score == nil do
      maximize(List.first(node.children))
    else
      node.score
    end
  end
end
