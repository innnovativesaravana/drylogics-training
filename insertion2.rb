def insertion_sort(array)
  array_length = array.length - 1
  array_length.times{|i| 
    (array_length - i).times{|j|
      if array[i] > array[i + j + 1]
        temp = array[i]
        array[i] = array[i + j + 1]
        array[i + j + 1] = temp
      end
    }
  }
  return array
end

array = [6,3,5,4,1,7,2,8]


print insertion_sort(array)



# def insertion_sort(array,ascending)
#   array_length = array.length - 1
#   array_length.times{|i| 
#     (array_length - i).times{|j|
#       if ascending
#         if array[i] > array[i + j + 1]
#         temp = array[i]
#         array[i] = array[i + j + 1]
#         array[i + j + 1] = temp
#         end
#       else
#         if array[i] < array[i + j + 1]
#         temp = array[i]
#         array[i] = array[i + j + 1]
#         array[i + j + 1] = temp
#         end
#       end
#     }
#   }
#   return array
# end

# array = [6,3,5,4,1,7,2,8]


# print insertion_sort(array,ascending = false)

