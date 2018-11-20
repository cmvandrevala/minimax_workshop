defmodule MinimaxWorkshop do
  def score(node) do
    if node.score == nil do
      Enum.max(Enum.map(node.children, &maximize/1))
    else
      node.score
    end
  end

  defp maximize(node) do
    if node.score == nil do
      Enum.min(Enum.map(node.children, &minimize/1))
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
