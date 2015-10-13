#!/usr/bin/env ruby

class Excel

  ALPHABET = ('A'..'ZZZ').to_a

  def get_column_name(line_number)
    ALPHABET[line_number - 1]
  end

end

File.open ARGV[0] do |file|
  excel = Excel.new
  file.each_line do |line|
    line_number = line.chomp.to_i
    puts excel.get_column_name(line_number)
  end
end
