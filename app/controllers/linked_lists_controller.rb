class LinkedListsController < ApplicationController

  # GET /linked_lists/sorted_insert
  def sorted_insert
    inputs = [2,5,1,19,11,25,11,26,27]
    results = []
    list = LinkedList.new
    inputs.each do |input|
      list.sorted_insert(input)
      results << list.to_s
    end

    render json: results
  end
end