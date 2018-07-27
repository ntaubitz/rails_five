class LinkedListsController < ApplicationController
  INPUTS = [2,5,1,19,11,25,4,26,27]

  before_action :set_linked_list

  # GET /linked_lists/sorted_insert
  def sorted_insert
    render json: @results
  end

  def delete_node
    results = []
    results << "inputs: #{INPUTS.join(',')}"
    results << "sorted: #{@list.output_results}"
    node = @list.find_node(1)
    @list.delete_node(node)
    node = @list.find_node(11)
    @list.delete_node(node)
    node = @list.find_node(27)
    @list.delete_node(node)

    results << @list.output_results

    render json: results
  end

  def set_linked_list

    @results = []
    @list = LinkedList.new
    INPUTS.each do |input|
      @list.sorted_insert(input)
      @results << @list.to_s
    end
  end
end