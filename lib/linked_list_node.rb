class LinkedListNode
  attr_accessor :right
  attr_accessor :value

  def initialize(value, right=nil)
    self.value = value
    self.right = right
  end

  def to_s
    "Node value: #{self.value} right?: #{!self.right.nil?}"
  end
end