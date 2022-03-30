def sum_with_for(min, max)
  # CONSTRAINT: you should use a for..end structure
  return -1 if min > max

  sum_correct = 0
  if min < max
    for num in (min..max)
      sum_correct = num + sum_correct
    end
    return sum_correct
  end
end

def sum_with_while(min, max)
  # CONSTRAINT: you should use a while..end structure
  return -1 if min > max

  i = min
  sum = 0
  while i <= max
    sum += i
    i += 1
  end
  return sum
end
