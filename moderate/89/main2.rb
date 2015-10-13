#!/usr/bin/env ruby

class Tree
  attr_accessor :lvl_up, :lvl_down

  def initialize(root)
    @lvl_up = [root]
    @lvl_down = []
  end

  def add_line(line)
    self.lvl_down = line
    move_up
  end

  def show_max
    lvl_up.max
  end

  private

  def move_up
    gain_maxes
    swap
  end

  def gain_maxes
    self.lvl_down = lvl_down.each_with_index.map do |node, index|
      node += greater_parent(index)
    end
  end

  def parents(index)
    if index == 0
      return [lvl_up[0]]
    end
    return lvl_up[(index-1).abs], lvl_up[index]
  end

  def greater_parent(index)
    parents(index).compact.max
  end

  def swap
    self.lvl_up = lvl_down
  end

end

class ParseLine
  attr_reader :line

  def initialize(line)
    @line = line
  end

  def level
    line.strip.split.map(&:to_i)
  end

end

File.open ARGV[0] do |file|
  root = file.gets.strip.to_i
  tree = Tree.new(root)
  file.each_line do |line|
    line = ParseLine.new(line).level
    tree.add_line(line)
  end
  puts tree.show_max
end
