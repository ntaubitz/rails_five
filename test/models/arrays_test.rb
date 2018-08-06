require File.expand_path('../../test_helper', __FILE__)

class ArraysTest < ActiveSupport::TestCase
  setup do
    @arrays = Arrays.new
  end

  test 'zero is not in the array' do
    assert false == @arrays.can_win?([1,2,3], 0)
  end

  test 'index is outside the bounds' do
    assert false == @arrays.can_win?([2, 4, 2, 0, 5], 4)
  end

  test 'can win' do
    assert true == @arrays.can_win?([2, 4, 1, 0, 5], 0)
  end
end