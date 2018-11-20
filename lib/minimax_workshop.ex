defmodule MinimaxWorkshop do
  def score(node), do: score(node, 0)

  def score(node, level) do
    if node.score == nil do
      Enum.max(Enum.map(node.children, &maximize(&1, level + 1)))
    else
      node.score
    end
  end

  defp maximize(node, level) do
    if node.score == nil do
      Enum.min(Enum.map(node.children, &minimize(&1, level + 1)))
    else
      node.score
    end
  end

  defp minimize(node, level) do
    if node.score == nil do
      Enum.max(Enum.map(node.children, &maximize(&1, level + 1)))
    else
      node.score
    end
  end
end
