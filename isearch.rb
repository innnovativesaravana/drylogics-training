
def isearch(low, high)
  while(true)
    f_low = yield(low)
    f_high = yield(high)
    return low if(f_low == 0)
    return high if(f_high == 0)
    return nil if(f_low == 1 or f_high == -1)
    middle = low + (high - low) / 2
    case(yield(middle))
    when 1
      high = middle - 1      
    when 0
      return middle
    when -1
      low = middle + 1
    end
  end
  raise "code should never come here"
end


def search(low, high)
  result = -1
  i = 0
  while(yield(low) < 1 and yield(high) > -1)
    i+=1
    middle = low + (high - low) / 2
    case(yield(middle))
    when 1
      high = middle - 1      
    when 0
      result = middle
      break
    when -1
      low = middle + 1
    end
  end
  # return i
  return result
end

# 2 4 8 16 32 64 128 256

def lsearch(low, high)
  result = -1
  for i in (1..(Math.log(high - low, 2)).ceil)
    middle = low + (high - low) / 2
    case(yield(middle))
    when 1
      high = middle - 1      
    when 0
      result = middle
      break
    when -1
      low = middle + 1
    end
  end
  return result
end



# values = [3, 6, 7, 8, 9, 31, 61, 71, 81, 91, 112, 123, 135, 140, 141]
# [2, 13, 7, 8, 10].each { |v|
#   p "Evaluating for #{v}"
#   p lsearch(0, values.length - 1) { |x|
#     values[x] <=> v
#   }
# }

[6, 30, 123725874562748213426040552, 123725874562748213426040553, (123725874562748213426040552 * 123725874562748213426040553)].each { |c|
  high = c
  p isearch(1, high) { |x|
    ((x + 1) * x) <=> c
  }
}

[6, 30, 123725874562748213426040552, 123725874562748213426040553, (123725874562748213426040552 * 123725874562748213426040553)].each { |c|
  high = c
  p search(1, high) { |x|
    ((x + 1) * x) <=> c
  }
}

[6, 30, 123725874562748213426040552, 123725874562748213426040553, (123725874562748213426040552 * 123725874562748213426040553)].each { |c|
  high = c
  p lsearch(1, high) { |x|
    ((x + 1) * x) <=> c
  }
}


