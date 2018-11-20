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

  test "it returns the score of a game with one move and two possible end states" do
    child_one = %TreeNode{score: 0}
    child_two = %TreeNode{score: 1}
    parent = %TreeNode{children: [child_one, child_two]}
    assert MinimaxWorkshop.score(parent) == 1
  end

  test "it returns the score of a game with three moves where only the maximizer gets to move" do
    # We can also play a game three moves deep!
    leaf_1 = %TreeNode{score: 11}
    leaf_2 = %TreeNode{score: 10}
    leaf_3 = %TreeNode{score: 22}
    leaf_4 = %TreeNode{score: -5000}
    grandchild_1 = %TreeNode{children: [leaf_1, leaf_2]}
    grandchild_2 = %TreeNode{children: [leaf_3, leaf_4]}
    child_one = %TreeNode{children: [grandchild_1]}
    child_two = %TreeNode{children: [grandchild_2]}
    parent = %TreeNode{children: [child_one, child_two]}
    assert MinimaxWorkshop.score(parent) == 22
  end
end
