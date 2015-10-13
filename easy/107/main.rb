class Sequence
  attr_reader :sequence

  def initialize(sequence)
    @sequence = sequence
  end

  def shortest_subsequence
    (0...sequence.length).each do |iterator|
       break iterator + 1 if is_subseqence?(iterator)
    end
  end

  private

  def is_subseqence?(iterator)
    sequence.split(sequence[0..iterator]).join.length == 0
  end

end

File.open ARGV[0] do |file|
  file.each_line do |line|
    sequence = line.strip
    puts Sequence.new(sequence).shortest_subsequence
  end
end
