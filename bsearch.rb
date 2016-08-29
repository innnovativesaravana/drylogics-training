# n^2 - n = c

def search(c, low, high)
  return -1 if yield(high) < c or yield(low) > c
  middle =  low + (high - low) / 2
  case(c <=>  yield(middle))
    when 1
      search(c, middle + 1, high)
    when 0
      return middle
    when -1
      search(c, low, middle - 1)
  end
end


# search(30, 1, 30 / 2)

[123725874562748213426040552].each { |c|
  half = c / 2
  p search(c, 1, c)  { |x|
    (x + 1) * x
  }
}

[20, 4002000].each { |v|
  half = v / 2
  p search(v, 1, half)  
}


[6].each { |c|
  half = c / 2
  p search(c, 1, c) { |x|
    (x + 1) * x
  }
}
  

# search(30, 1, 30 / 2)
# 123725874562748213426040552
