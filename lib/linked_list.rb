class LinkedList
  attr_accessor :head

  def sortedInsert(values)
    if values.is_a?(Array)
      nodes = []
      values.each{|v| nodes << insertValueSorted(v)}
      return nodes
    else
      return insertValueSorted(values)
    end
  end

  def outputResults()
    output = []
    node = self.head
    while !node.nil?
      output << node.value
      node = node.right
    end
    puts output.join(',')
  end

  def self.doIt
    l=LinkedList.new
    l.sortedInsert(2)
    l.outputResults()
    l.sortedInsert(3)
    l.outputResults()
    l.sortedInsert(10)
    l.outputResults()
    l.sortedInsert(19)
    l.outputResults()
    l.sortedInsert(7)
    l.outputResults()
    l.sortedInsert(1)
    l.outputResults()


  end

  private

  def insertValueSorted(value)
    # insert 2
    # 1,2,3,4,5
    #   p
    if self.head.nil?
      self.head = LinkedListNode.new(value)
    elsif self.head.value >= value
      self.head = LinkedListNode.new(value, right=self.head)
    else
      current =self.head
      while !current.right.nil? && current.right.value < value
        current = current.right
      end
      new_node = LinkedListNode.new(value, right=current.right)
      current.right = new_node
    end


  end
end