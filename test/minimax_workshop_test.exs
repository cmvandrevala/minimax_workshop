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

  test "it returns the score of a game with two moves and two possible end states" do
    grandchild_one = %TreeNode{score: 1}
    grandchild_two = %TreeNode{score: 0}
    child = %TreeNode{children: [grandchild_one, grandchild_two]}
    parent = %TreeNode{children: [child]}
    assert MinimaxWorkshop.score(parent) == 0
  end

  test "it returns the score of a game with two moves and three possible end states" do
    grandchild_1 = %TreeNode{score: 12}
    grandchild_2 = %TreeNode{score: -10}
    grandchild_3 = %TreeNode{score: 4}
    child = %TreeNode{children: [grandchild_1, grandchild_2, grandchild_3]}
    parent = %TreeNode{children: [child]}
    assert MinimaxWorkshop.score(parent) == -10
  end

  test "it returns the score of a game with four moves and only the minimizer gets to move" do
    # Without even realizing it, we have already covered games that are deeper than two levels!
    leaf_1 = %TreeNode{score: 1}
    leaf_2 = %TreeNode{score: 0}
    leaf_3 = %TreeNode{score: 2}
    leaf_4 = %TreeNode{score: -5}
    node_level3_a = %TreeNode{children: [leaf_1, leaf_2]}
    node_level3_b = %TreeNode{children: [leaf_3, leaf_4]}
    grandchild_1 = %TreeNode{children: [node_level3_a]}
    grandchild_2 = %TreeNode{children: [node_level3_b]}
    child = %TreeNode{children: [grandchild_1, grandchild_2]}
    parent = %TreeNode{children: [child]}
    assert MinimaxWorkshop.score(parent) == -5
  end
end
