def insertion
 array = [6,3,5,4,1,7,2,8]
 array_length = array.length 
# array_length.times{|i| 
#  ( i + 1 ).times{|j|
#    a = array[j]
#    b = array[j + 1]
#   if b < a
#     c = a
#     a = b
#     b = c  
#   end
#   array[j] = a
#   array[j + 1] = b
#   print array[j] 
#  }
#  print "\n"
# }
i = 0
while ( i < array_length )
  if array[i + 1] < array[i]
    # temp = array[i]
    # array[i + 1] = array[i]
    # array[i]= temp
    print array[i],array[i + 1]
  end
  # print array[i]
  i +=1
end
end
p insertion