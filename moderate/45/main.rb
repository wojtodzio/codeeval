#!/usr/bin/env ruby

class Palindrome
  attr_reader :number
  attr_accessor :iterations, :palindrome

  def initialize(number)
    @number = number
    @iterations = 0
    @palindrome = number
    generate_palindrome
  end

  private

  def generate_palindrome
    until palindrome == reverse_palindrome
      self.iterations += 1
      self.palindrome += reverse_palindrome
    end
  end

  def reverse_palindrome
    palindrome.to_s.reverse.to_i
  end

end

File.open ARGV[0] do |file|
  file.each_line do |line|
    number = line.strip.to_i
    palindrome = Palindrome.new(number)
    puts "#{palindrome.iterations} #{palindrome.palindrome}"
  end
end
