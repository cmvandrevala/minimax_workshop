defmodule MinimaxWorkshopTest do
  use ExUnit.Case
  import TreeNode

  test "it returns the score of a node with no children" do
    node = %TreeNode{score: -1}
    assert MinimaxWorkshop.score(node) == -1
  end

  test "it returns the score of a node with one child" do
    child = %TreeNode{score: 22}
    parent = %TreeNode{children: [child]}
    assert MinimaxWorkshop.score(parent) == 22
  end

  test "it returns the score of a linked list of nodes" do
    grandchild = %TreeNode{score: 17}
    child = %TreeNode{children: [grandchild]}
    parent = %TreeNode{children: [child]}
    assert MinimaxWorkshop.score(parent) == 17
  end
end
