#!/usr/bin/env ruby

class Matrix

  def initialize(array)
    @array = array
  end

  def sort
    transform
    @array.sort!
    transform
    self
  end

  def transform
    @array = @array.transpose
  end

  def show
    @array.map {|row| row.join(' ')}.join(" | ")
  end
end

class ParseLine

  def initialize(line)
    @line = line
  end

  def array
    @line.chomp!
    @line.split("|").map {|i| i.strip.split.map(&:to_i)}
  end

end

File.open ARGV[0] do |file|
  file.each_line do |line|
    collection = ParseLine.new(line)
    puts Matrix.new(collection.array).sort.show
  end
end
