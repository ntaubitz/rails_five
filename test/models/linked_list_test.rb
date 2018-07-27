require File.expand_path('../../test_helper', __FILE__)

class LinkedListTest < ActiveSupport::TestCase
  setup do
    @list = LinkedList.new
    @inputs = [2,5,1,19,11,25,4,26,27]
    @inputs.each do |input|
      @list.sorted_insert input
    end
  end

  test 'linked list is sorted' do
    assert 9 == @list.node_count
    assert [1,2,4,5,11,19,25,26,27] == @list.values
  end

  test 'node is deleted' do
    node = @list.find_node 19
    @list.delete_node node
    assert 8 == @list.node_count
    assert [1,2,4,5,11,25,26,27] == @list.values
  end
end