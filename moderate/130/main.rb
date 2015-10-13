#!/usr/bin/env ruby

class TextPatternMatcher
  attr_reader :pattern, :text

  def initialize(pattern, text)
    @pattern = pattern
    @text = text
  end

  def match?
    return false unless valid_pattern?

  end

  private

  def array
    @array ||= Array.new(pattern.size) { Array.new(text.size) }
  end

  def valid_pattern?
    return false if  pattern.size > text.size
    true
  end

end

File.open ARGV[0] do |file|
  file.each_line do |line|
    pattern, text = line.strip.split
    TextPatternMatcher.new(pattern, text).match?
  end
end
