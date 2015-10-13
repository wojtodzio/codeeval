# By starting at the top of the triangle and moving to adjacent numbers on the
# row below, the maximum total from top to bottom is 27.
#
#    5
#   9 6
#  4 6 8
# 0 7 1 5
#
# 5 + 9 + 6 + 7 = 27

rows = File.open(ARGV[0]).map do |line|
  line.split(' ').map(&:to_i)
end

# Starting from the bottom row of the triangle, find the maximum of each pair of
# adjacent numbers and add it to their common ancestor. As we move up the
# triangle the maximum path value will propagate up, eventually setting the
# topmost value to the answer.
(rows.count - 1).downto(1) do |level|
  (rows[level].count - 1).downto(1) do |column|
    rows[level - 1][column - 1] += [rows[level][column], rows[level][column - 1]].max
  end
end

puts rows[0][0]
