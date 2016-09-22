require "byebug"
# def search(c, low, high)
#   return -1 if (high - 1) * high < c or (low - 1) * low > c

#   middle =  low + (high - low) / 2
#   case(c <=>  (middle - 1) * middle)
#     when 1
#       search(c, middle + 1, high)
#     when 0
#       return middle
#     when -1
#       search(c, low, middle - 1)
#   end
# end






















# , 123725874562748213426040552

def search(low, high, &block)
  return -1 if block.call(high) == 1 or block.call(low) == -1 
  # return -1 if block.call(high) < c or block.call(low) > c 
  middle =  low + (high - low) / 2
  case(block.call(middle))
    when 1
      search(middle + 1, high, &block)
    when 0
      return middle
    when -1
      search(low, middle - 1, &block)
  end
end

[6, 123725874562748213426040552].each { |c|
  half = c / 2
  p search(1, half) { |x|
    c <=> ((x - 1) * x)
  }
}

def search(c, low, high, &block)
  return -1 if block.call(high) < c or block.call(low) > c
  middle =  low + (high - low) / 2
  case(c <=>  block.call(middle))
    when 1
      search(c, middle + 1, high, &block)
    when 0
      return middle
    when -1
      search(c, low, middle - 1, &block)
  end
end

[6, 123725874562748213426040552].each { |c|
  half = c / 2
  p search(c, 1, half) { |x|
    (x - 1) * x
  }
}


# [123725874562748213426040552].each { |c|
#   half = c / 2
#   p search(c, 1, c)
# }


# [20, 4002000].each { |v|
#   half = v / 2
#   p search(v, 1, half)  
# }


# search(30, 1, 30 / 2)
 

# [123725874562748213426040552].each { |c|
#   half = c / 2
#   p search(c, 1, c)  { |x|
#     (x + 1) * x
#   }
# }


# def fact(n)
#   if n == 0
#     1
#   else
#     n*fact(n-1)
#   end
# end

# [5].each { |n|
# p fact(n)
# }



# def pi
#   a = 22.to_f
#   b = 7.to_f
#   pi = a / b
# end


# def pi(a,b)
#   pi = (a.to_f / b.to_f)
# end

# pi(22,7)


# def pi
#   num = 4.to_f
#   pi = 0.to_f
#   plus = true
#   den = 1.to_f
#   while den < 100000
#     if plus
#       pi = pi + num / den
#       plus = false
#       p pi
#     else
#       pi = pi - num / den
#       plus = true
#       p pi
#     end
#   den = den + 2.to_f
#   end
#   pi
# end




def pi(decimal_places, a = 22)
  return "" if decimal_places == 0
  if a == 22
    quotient = "3."
  else
    a *= 10
    decimal_places -= 1
    quotient = (a / 7).to_s
  end
  quotient + pi(decimal_places, (a % 7))
end

pi(6)
    
# def divide(a, b, max_depth = 20)
#   if a < b

#   else
#   end
# end

# def pi
#   divide(22, 7, 200)
# end

# pi




# def factorial(n)
#   n > 1 ? n * factorial(n-1) : 1
# end




# 10987654321

# 12345678910

# 1..3

# 321
# 123

# def concat(number)
#   return "1" if number == 1
#   concat(number - 1) + number.to_s
# end

# def concat(number)
#   result = ""
#   while(number > 0) do
#     result = number.to_s + result 
#     number -= 1
#   end
#   result
# end


def concat(number)
  stack = []
  while(number > 0) do
    state = {n: number, ret: number.to_s}
    stack.push(state)
    number -= 1
  end

  result = ""
  while(stack.length > 0)
    result = stack.pop[:ret] + result
  end
  result
end
# concat(10)
# concat(10)
# concat(50)
# concat(20)

# add(10)



# def str(n, chr)
#   n > 1 ? chr + str(n-1, chr) : chr
# end


# str(20, "*")


