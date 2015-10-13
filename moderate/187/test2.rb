PREPROC = [0, 0, 1, 0, 2, 0, 2, 0, 4, 0, 96, 0, 1024, 0, 2880, 0, 81024, 0, 770144]

File.open ARGV[0] do |file|
  file.each_line do |line|
    puts PREPROC[line.strip.to_i]
  end
end
