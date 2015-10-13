class SeqTransform
  attr_reader :pattern, :string

  TRANSFORM = ['(A+)', '(A+|B+)']

  def initialize(pattern, string)
    @pattern = pattern
    @string = string
  end

  def can_be_transformed?
    generate_regex =~ string ? 'Yes' : 'No'
  end

  private

  def generate_regex
    regex = pattern.gsub('0', TRANSFORM[0]).gsub('1', TRANSFORM[1])
    regex[/\A/] = '\A'
    regex << '\z'
    Regexp.new(regex)
  end

end

File.open ARGV[0] do |file|
  file.each_line do |line|
    pattern, string = line.strip.split
    #pattern.gsub!(/0+/, '0')
    #string.gsub!(/B+/, 'B')
    puts SeqTransform.new(pattern, string).can_be_transformed?
  end
end
