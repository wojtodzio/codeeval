#!/usr/bin/env ruby

class Stack
  attr_accessor :stack

  def initialize
    @stack = []
  end

  def push(value)
    stack << value
  end

  def pop
    stack.pop
  end

  def empty?
    stack.empty?
  end

  def every_second
    list = []
    until empty?
      list << pop
      pop
    end
    list.join(' ')
  end

end

File.open ARGV[0] do |file|
  file.each_line do |line|
    list = line.split
    stack = Stack.new
    list.each do |number|
      stack.push(number)
    end
    puts stack.every_second
  end
end
