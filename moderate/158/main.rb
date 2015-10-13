#!/usr/bin/env ruby

class Collection
  attr_writer :last
  attr_accessor :position, :iterations
  attr_reader :collection

  def initialize(collection, iterations)
    @collection = collection
    @iterations = iterations
    @position = -1
  end

  def bubble
    loop do
      next_position
      break if iterations == 0 or last == 0
      change if should_swap?
    end
    @collection.join(' ')
  end

  private

  def last
    @last ||= @collection.size > 1 ? @collection.size - 2 : 0
  end

  def next_position
    if position == last
      self.iterations -= 1
      self.last -= 1
      self.position = 0
    else
      self.position += 1
    end
  end

  def change
    collection[position], collection[position.next] = collection[position.next], collection[position]
  end

  def should_swap?
    collection[position] > collection[position.next]
  end
end

class ParseLine
  attr_reader :line

  def initialize(line)
    @line = line
  end

  def collection
    elements[:numbers].split.map(&:to_i)
  end

  def iterations
    elements[:iterations].to_i
  end

  private

  def elements
    @elements ||= line.match(/(?<numbers>\A(\d+ | \s)*)\|\s(?<iterations>\d+)\n\z/)
  end

end

File.open ARGV[0] do |file|
  file.each_line do |line|
    params = ParseLine.new(line)
    puts Collection.new(params.collection, params.iterations).bubble
  end
end


