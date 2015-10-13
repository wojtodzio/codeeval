PRIMES = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31]

def ComputeNumNecklaces(beads, numBeads, fromPosition)
  if fromPosition == numBeads
    if isPrime?( beads[0] + beads[numBeads-1]  )
      return 1
    else
      return 0
    end
  end

  count = 0
  previousNumber = beads[fromPosition - 1]
  if isPrime?( previousNumber + beads[fromPosition]  )
    count += ComputeNumNecklaces(beads, numBeads, fromPosition + 1)
  end
  ((fromPosition+1)...numBeads).each do |pos|
    if isPrime?(previousNumber + beads[pos])
      swap(beads, fromPosition, pos)
      count += ComputeNumNecklaces(beads, numBeads, fromPosition + 1)
      swap(beads, fromPosition, pos)
    end
  end

  return count
end

def isPrime?(number)
  PRIMES.include?(number)
end

def swap(array, pos1, pos2)
  array[pos1], array[pos2] = array[pos2], array[pos1]
end

def read(path)
  File.open path do |file|
    file.each_line do |line|
      numBeads = line.strip.to_i
      beads = (1..numBeads).to_a
      count = ComputeNumNecklaces(beads, numBeads, 1)
      puts count
    end
  end
end

read(ARGV[0])
