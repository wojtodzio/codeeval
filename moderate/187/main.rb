#!/usr/bin/env ruby

class Necklace

  PRIMES = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31]
  def initialize

  end

  def num_of_permutations

  end

  private

  def is_prime?(number)
    PRIMES.include?(number)
  end

  def is_the_same?(array1, array2)
    i = 0
    q = array2.find_index(array1[0])
    loop do
      break false unless array1[i] == array2[q]
      i -= 1
      q -= 1
      break true unless array1[i]
    end
  end

end

File.open ARGV[0] do |file|
  file.each_line do |line|
    n = line.strip.to_i
    necklace = Necklace.new(n)
    puts necklace.num_of_permutations
  end
end
