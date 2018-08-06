class Arrays

  # Given an array and a starting index, determine whether it's possible to reach 0 by starting at
  # index and repeatedly jumping left/right the distance found at array[index].
  # Return true if it is possible to reach 0, false otherwise.
  # function canWin(array, index) {
  #
  # }
  #
  # var result = canWin([2, 4, 1, 0, 5], 0); // => true
  def can_win?(array, index, indexes_visited=nil)
    return false unless array.include?(0)
    return false if index < 0
    return false if index >= array.count

    indexes_visited = [] if indexes_visited.nil?

    return false if indexes_visited.include?(index)
    # stop if zero desn't exist
    # stop if i've been to this index before
    # stop if a jump takes you past the bounds of the array
    # you can't win if a left and a right jump are outside the bounds of the array

    return true if array[index] == 0

    indexes_visited << index

    jump_length = array[index]
    left = can_win?(array, index - jump_length, indexes_visited)
    right = can_win?(array, index + jump_length, indexes_visited)

    left || right
  end
end