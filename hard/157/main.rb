#!/usr/bin/env ruby

require 'set'

class Node
  attr_accessor :y, :x, :value, :before, :associations
  def initialize(y, x, value=Float::INFINITY)
    @y = y
    @x = x
    @value = value
    @before = nil
    @associations = Set.new
  end
end

class Graph
  attr_accessor :nodes, :first_node, :last_node, :visited, :queue, :solution
  attr_reader :len_x, :len_y

  VECTORS = [ [0, -1], [-1, 0], [0, 1], [1, 0] ]

  def initialize(len_y, len_x, first_node, last_node)
    @nodes = Array.new(len_y + 1) { {} }
    @queue = [first_node]
    @first_node = first_node
    @last_node = last_node
    @len_x = len_x
    @len_y = len_y
    @len_y_decremented = len_y - 1
    @solution = Array.new(len_y) { {} }
    @solution[last_node.y][last_node.x] = true
    add_node(first_node)
    add_node(last_node)
  end

  def solve
    dijsktra
    before = last_node.before
    while before
      solution[before.y][before.x] = true
      before = before.before
    end
    self
  end

  def draw_solution
    (0...len_y).each do |y|
      (0...len_x).each do |x|
        if solution[y][x]
          print "+"
        else
          print nodes[y][x] ? ' ': "*"
        end
      end
      puts
    end

  end

  def add_node(node)
    self.nodes[node.y][node.x] = node
    find_associations(node)
  end

  private

  def find_associations(node)
    VECTORS.each do |vector_y, vector_x|
      if node2 = nodes[node.y + vector_y][node.x + vector_x]
        node2.associations << node
        node.associations << node2
      end
    end
  end

  def dijsktra
    until queue.empty?
      node = queue.pop
      node.associations.each do |node2|
        if node2.value > node.value + 1
          node2.value = node.value + 1
          node2.before = node
          queue.unshift(node2)
        end
      end
    end
  end

end

class ParseGraph
  attr_reader :raw_graph, :graph

  def initialize(raw_graph)
    @raw_graph = raw_graph
  end

  def generate_graph
    create_graph
    populate_graph
    graph
  end

  private

  def populate_graph
    (1...len_y-1).each do |y|
      (1...len_x-1).each do |x|
        if raw_graph[y][x] == ' '
          node = Node.new(y, x)
          graph.add_node(node)
        end
      end
    end
  end

  def len_x
    @len_x ||= raw_graph[0].size
  end

  def len_y
    @len_y ||= raw_graph.size
  end

  def first_node
    @first_node ||= Node.new(0, raw_graph.first.index(' '), 0)
  end

  def last_node
    @last_node ||= Node.new(len_y - 1, raw_graph.last.index(' '))
  end

  def create_graph
    @graph = Graph.new(len_y, len_x, first_node, last_node)
  end

end

File.open ARGV[0] do |file|
  raw_graph = file.readlines.map(&:chomp)
  graph = ParseGraph.new(raw_graph).generate_graph
  graph.solve.draw_solution
end
