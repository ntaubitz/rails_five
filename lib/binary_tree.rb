class BinaryTree
  attr_accessor :root

  def initialize(tree_json=nil)
    unless tree_json.nil?
      self.root = from_json(JSON.parse(tree_json).with_indifferent_access)
    end
  end

  def create_node(weight, *args)
    node = BinaryTreeNode.new(weight)
    if get_arg(:root, args, false)
      self.root = node
    end
    if (parent = get_arg(:parent, args, nil))
      parent.left = node if get_arg(:direction, args, nil) == :left
      parent.right = node if get_arg(:direction, args, nil) == :right
    end
    node
  end

  def to_json
    return nil if root.nil?
    JSON.dump(root.to_json)
  end

  def minimum_depth
    return 0 if self.root.nil?

    find_minimum_node_depth(self.root, 1)
  end

  private

  def find_minimum_node_depth(node, current_depth)
    # You are a leaf, final depth
    return current_depth if node.is_leaf?
    # You have 2 branches or 1
    if !node.left.nil? && !node.right.nil?
      left_depth = find_minimum_node_depth(node.left, current_depth + 1)
      right_depth = find_minimum_node_depth(node.right, current_depth + 1)
      return left_depth < right_depth ? left_depth : right_depth
    else
      return find_minimum_node_depth(node.left, current_depth + 1) unless node.left.nil?
      return find_minimum_node_depth(node.right, current_depth + 1) unless node.right.nil?
    end
  end

  def from_json(json)
    node = create_node(json[:weight])
    node.left = from_json(json[:nodes][:left]) unless json[:nodes][:left].nil?
    node.right = from_json(json[:nodes][:right]) unless json[:nodes][:right].nil?
    node
  end

  def get_arg(key, args, default)
    arg = args.select{|a| a.keys.include?(key)}.first
    return default if arg.nil?
    arg[key]
  end
end