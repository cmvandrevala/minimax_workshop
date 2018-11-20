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

  test "it returns the score for a deeply nested game" do
    leaf_1 = %TreeNode{score: 1}
    leaf_2 = %TreeNode{score: -2}
    leaf_3 = %TreeNode{score: 2}
    leaf_4 = %TreeNode{score: -5}
    leaf_5 = %TreeNode{score: -11}
    leaf_6 = %TreeNode{score: -30}
    leaf_7 = %TreeNode{score: 20}
    leaf_8 = %TreeNode{score: 51}
    leaf_9 = %TreeNode{score: 12}
    leaf_10 = %TreeNode{score: 10}
    leaf_11 = %TreeNode{score: 6}
    leaf_12 = %TreeNode{score: 7}
    leaf_13 = %TreeNode{score: 8}
    leaf_14 = %TreeNode{score: 9}
    leaf_15 = %TreeNode{score: 3}
    leaf_16 = %TreeNode{score: 4}
    leaf_17 = %TreeNode{score: 7}
    leaf_18 = %TreeNode{score: 5}
    leaf_19 = %TreeNode{score: 9}
    leaf_20 = %TreeNode{score: 11}

    level4_a = %TreeNode{children: [leaf_1, leaf_2]}
    level4_b = %TreeNode{children: [leaf_3, leaf_4]}
    level4_c = %TreeNode{children: [leaf_5, leaf_6]}
    level4_d = %TreeNode{children: [leaf_7, leaf_8]}
    level4_e = %TreeNode{children: [leaf_9, leaf_10]}
    level4_f = %TreeNode{children: [leaf_11, leaf_12]}
    level4_g = %TreeNode{children: [leaf_13, leaf_14]}
    level4_h = %TreeNode{children: [leaf_15, leaf_16]}
    level4_i = %TreeNode{children: [leaf_17, leaf_18]}
    level4_j = %TreeNode{children: [leaf_19, leaf_20]}

    level3_a = %TreeNode{children: [level4_a, level4_b]}
    level3_b = %TreeNode{children: [level4_c, level4_d]}
    level3_c = %TreeNode{children: [level4_e, level4_f]}
    level3_d = %TreeNode{children: [level4_g, level4_h]}
    level3_e = %TreeNode{children: [level4_i, level4_j]}
    level3_f = %TreeNode{score: 1}
    level3_g = %TreeNode{score: 2}
    level3_h = %TreeNode{score: 61}

    level2_a = %TreeNode{children: [level3_a, level3_b]}
    level2_b = %TreeNode{children: [level3_c, level3_d]}
    level2_c = %TreeNode{children: [level3_e, level3_f]}
    level2_d = %TreeNode{children: [level3_g, level3_h]}

    level1_a = %TreeNode{children: [level2_a, level2_b]}
    level1_b = %TreeNode{children: [level2_c, level2_d]}

    root = %TreeNode{children: [level1_a, level1_b]}
    assert MinimaxWorkshop.score(root) == 7
  end
end
