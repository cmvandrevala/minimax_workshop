defmodule TreeNodeTest do
  use ExUnit.Case

  import TreeNode

  test "it has a default score of nil" do
    node = %TreeNode{}
    assert node.score == nil
  end

  test "it can be set with a score" do
    node = %TreeNode{score: 7}
    assert node.score == 7
  end

  test "it has no children by default" do
    node = %TreeNode{}
    assert node.children == []
  end

  test "it can be set with one child" do
    child = %TreeNode{score: 1}
    parent = %TreeNode{score: 2, children: [child]}
    assert parent.children == [child]
  end

  test "can be set with many children" do
    child_one = %TreeNode{score: 1}
    child_two = %TreeNode{score: 2}
    parent = %TreeNode{children: [child_one, child_two]}
    assert parent.children == [child_one, child_two]
  end
end
