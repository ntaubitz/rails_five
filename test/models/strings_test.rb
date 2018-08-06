require File.expand_path('../../test_helper', __FILE__)

class StringsTest < ActiveSupport::TestCase
  setup do
    @strings = Strings.new
  end

  # test 'reverse a string without moving special characters' do
  #   outputs = ["c,b$a", "i!!!h.g.f,e'd,cba"]
  #   ['a,b$c',"a!!!b.c.d,e'f,ghi"].each_with_index do |input, i|
  #     assert outputs[i] == @strings.reverse(input)
  #   end
  # end
  #
  # test 'finds all palindromic partitions' do
  #   # inputs = ['nitin', 'geeks']
  #   # outputs = [
  #   #   [
  #   #     'n i t i n',
  #   #     'n iti n',
  #   #     'nitin'
  #   #   ],
  #   #   [
  #   #     'g e e k s',
  #   #     'g ee k s'
  #   #   ]
  #   # ]
  #   inputs = ['geeks']
  #   outputs = ['g e e k s', 'g ee k s']
  #   inputs.each_with_index do |input, i|
  #     results = @strings.palindromic_partitions(input)
  #     outputs.each do |output|
  #       assert results.include? output
  #     end
  #     results.each do |output|
  #       assert outputs.include? output
  #     end
  #   end
  # end
end