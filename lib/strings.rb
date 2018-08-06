class Strings
  def reverse(input)
    reversed = input.chars.reject{|c| is_special?(c)}.reverse
    index = 0
    output = ''
    input.length.times do |i|
      if is_special?(input[i])
        output += input[i]
      else
        output += reversed[index]
        index += 1
      end
    end
    output
  end

  def palindromic_partitions(input)
    # nitin
    # n itin
    #
    # n i tin
    # nit in
    # niti n
    # generate all partitions
    # reverse each partition
    # if all reversed partitions are found in the input it is a palindromic partition
    partitions = []
    # each character is a palindromic partition
    partitions << input.chars
    (input.length-1).times do |i|
      partitions << [input[0..i].reverse, input[i+1..input.length-1].reverse]
    end

    results = []
    partitions.each do |partition|
      all_found = true
      partition.each do |pal|
        all_found = false unless input.include?(pal)
      end
      results << partition.join(' ') if all_found
    end
    results
    puts results.inspect
    results
  end

  private

  def is_special?(character)
    character.index(/[^[:alnum:]]/) == 0
  end
end