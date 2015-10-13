File.open ARGV[0] do |file|
  file.each_line do |line|
    pattern, string = line.strip.split
    string.gsub!(/B+/, 'B')
    regex = pattern.gsub(/0+/, '(A+)').gsub('1', '(A+|B+)')
    regex[/\A/] = '\A'
    regex << '\z'
    puts "string: #{string}, pattern: #{pattern}, regex: #{regex}"
    puts Regexp.new(regex) =~ string ? 'Yes' : 'No'
  end
end
