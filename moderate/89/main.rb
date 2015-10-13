#!/usr/bin/env ruby

class Tree

  def initialize(root)
    tree = [root]
  end

end

class Node
  attr_accessor :value, :parents
  attr_reader :parents

  def initialize(value, parent1=nil, parent2=nil)
    @value = value
    @parents = if parent2
                [parent1, parent2]
               else
                 parent1
    end
  end

  def gain_value
    abandon_poorer_parent unless am_i_orphan?
    self.value += parents.value
  end

  private

  def abandon_poorer_parent
    parents = parents.first.value > parents.last.value ? parents.first : parents.last
  end

  def am_i_orphan?
    @parents.class != Array
  end

end
