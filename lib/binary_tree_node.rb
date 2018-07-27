class BinaryTreeNode
  attr_accessor :left, :right, :weight

  def initialize(weight, left=nil, right=nil)
    self.weight = weight
    self.left = left
    self.right = right
  end

  def to_json
    {
      weight: self.weight,
      nodes: {
        left: self.left.nil? ? nil : self.left.to_json,
        right: self.right.nil? ? nil : self.right.to_json
      }
    }
  end

  def is_leaf?
    self.left.nil? && self.right.nil?
  end
end