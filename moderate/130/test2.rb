def State[i, j] =
  (pattern[i] == '0' and text[j] == 'A') or pattern[i] == '1' if State[i-1, j-1]
  State[i-1, j] and text[j-1] == text[j]
end

pattern = 01001110
text = AAAABAAABBBBBBAAAAAAA

puts State
