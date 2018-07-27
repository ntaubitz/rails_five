require File.expand_path('../../test_helper', __FILE__)

class BinaryTreeTest < ActiveSupport::TestCase
  setup do
    @tree = BinaryTree.new

    @tree_serialized = JSON.dump(
      {
        weight: 1,
        nodes: {
          left: {
            weight: 2,
            nodes: {
              left: nil,
              right: nil
            }
          },
          right: {
            weight: 3,
            nodes: {
              left: nil,
              right: {
                weight: 4,
                nodes: {
                  left: nil,
                  right: nil
                }
              }
            }
          }
        }
      }
    )
  end

  test 'tree is serialized' do
    root_node = @tree.create_node(1, root: true)
    @tree.create_node(2, parent: root_node, direction: :left)
    node = @tree.create_node(3, parent: root_node, direction: :right)
    @tree.create_node(4, parent: node, direction: :right)

    assert @tree_serialized == @tree.to_json
  end

  test 'tree is deserialized' do
    tree = BinaryTree.new(@tree_serialized)
    assert tree.root.weight == 1
    assert tree.root.left.weight == 2
    assert tree.root.right.weight == 3
    assert tree.root.right.left.nil?
    assert tree.root.right.right.weight == 4
    assert tree.root.right.right.left.nil?
    assert tree.root.right.right.right.nil?
  end

  test 'tree minimum node depth is 2' do
    tree = BinaryTree.new(@tree_serialized)
    assert 2 == tree.minimum_depth
  end

  test 'tree minimum node depth is 3' do
    tree = BinaryTree.new(@tree_serialized)
    node = tree.root.left
    node = tree.create_node(5, parent: node, direction: :left)
    tree.create_node(6, parent: node, direction: :left)
    # the right side from root
    assert 3 == tree.minimum_depth
  end

  test 'maximum path sum is 6' do
    tree = BinaryTree.new(
      {
        weight: 1,
        nodes: {
          left: {
            weight: 3,
            nodes: {left: nil, right: nil}
          },
          right: {
            weight: 2,
            nodes: {left: nil, right: nil}
          }
        }
      }
    )
    assert 6 == tree.maximum_path_sum
  end

  test 'maximum path sum is 42' do
    tree = BinaryTree.new(
      {
        weight: 10,
        nodes: {
          left: {
            weight: 10,
            nodes: {
              left: {
                weight: -25,
                nodes: {
                  left: {
                    weight: 4,
                    nodes: {left:nil,right:nil}
                  },
                  right: {
                    weight: 3,
                    nodes: {left:nil,right:nil}
                  }
                }
              },
              right: nil
            }
          },
          right: {
            weight: 2,
            nodes: {
              left: {
                weight: 1,
                nodes: {left:nil,right:nil}
              }, right: {
                weight: 20,
                nodes: {left:nil,right:nil}
              }
            }
          }
        }
      }
    )
    assert 42 == tree.maximum_path_sum
  end
end