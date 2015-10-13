#!/usr/bin/env ruby

class Grid
  attr_accessor :array
  attr_reader :size

  def initialize(size, array)
    @size = size
    @array = array
  end

end

class Game
  attr_accessor :grid

#  DIRECTIONS = { 'RIGHT' => [0, 1], 'LEFT' => [0, -1], 'UP' => [1, 0], 'DOWN' => [-1, 0] }

  def initialize(grid)
    @grid = grid
  end

  def slide_to(direction)
    method("move_#{direction.downcase}").call
    self
  end

  def to_s
    grid.array.map{ |row| row.join(' ') }.join('|')
  end

  private

  def move_right
    (0...grid.size).each do |y|
      last_merged = grid.size
      (grid.size-1).downto(0).each do |x|
        tmp = x
        while tmp != last_merged
          if grid.array[y][tmp+1] == 0
            grid.array[y][tmp+1], grid.array[y][tmp] = grid.array[y][tmp], 0
            tmp += 1
          elsif grid.array[y][tmp+1] == grid.array[y][tmp]
            grid.array[y][tmp+1] += grid.array[y][tmp]
            grid.array[y][tmp] = 0
            last_merged = tmp
            break
          else
            break
          end
        end
      end
    end
  end

  def move_down
    grid.array = grid.array.transpose
    move_right
    grid.array = grid.array.transpose
  end

  def move_left
    grid.array.each(&:reverse!)
    move_right
    grid.array.each(&:reverse!)
  end

  def move_up
    grid.array = grid.array.transpose
    move_left
    grid.array = grid.array.transpose
  end

end

class GridParser
  attr_reader :raw_grid

  def initialize(raw_grid)
    @raw_grid = raw_grid
  end

  def generate_grid
    Grid.new(grid_size, grid_array)
  end

  def direction
    matched_grid[:direction]
  end

  private

  def grid_size
    matched_grid[:size].to_i
  end

  def grid_array
    matched_grid[:rows].split('|').map { |row| row.split.map(&:to_i) }
  end

  def matched_grid
    @matched_grid ||= raw_grid.match( /\A(?<direction>\w+);\s(?<size>\d+);\s(?<rows>((\d+\s?)+\|?)+)\z/ )
  end

end

File.open ARGV[0] do |file|
  file.each_line do |line|
    parser = GridParser.new(line)
    direction = parser.direction
    grid = parser.generate_grid
    game = Game.new(grid)
    game.slide_to direction
    puts game
  end
end
