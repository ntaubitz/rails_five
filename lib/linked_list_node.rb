class LinkedListNode
  attr_accessor :right
  attr_accessor :value

  def initialize(value, right=nil)
    self.value = value
    self.right = right
  end
end