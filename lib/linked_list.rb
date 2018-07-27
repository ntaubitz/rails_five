class LinkedList
  attr_accessor :head

  def to_s
    "nodes: #{node_count}: #{output_results}"
  end

  def sorted_insert(values)
    if values.is_a?(Array)
      nodes = []
      values.each{|v| nodes << insert_alue_sorted(v)}
      return nodes
    else
      return insert_value_sorted(values)
    end
  end

  def node_count
    count = 0
    current = head
    while !current.nil?
      count += 1
      current = current.right
    end
    count
  end

  def find_node(value)
    return nil unless self.head
    current = self.head
    while current
      return current if current.value == value
      current = current.right
    end
  end

  def delete_node(node)
    return if self.head.nil?

    # node is head
    if node.value == self.head.value
      self.head = self.head.right
      return
    end

    # node is in the chain
    current = self.head
    previous = nil
    while !current.right.nil? && current.value < node.value
      previous = current
      current = current.right
    end
    previous.right = current.right
  end

  def values
    output = []
    node = self.head
    while !node.nil?
      output << node.value
      node = node.right
    end
    output
  end

  def output_results
    return values.join(',')
  end

  private

  def insert_value_sorted(value)
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