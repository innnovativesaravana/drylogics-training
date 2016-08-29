def insertion_sort(array)
  array_length = array.length - 1
  array_length.times{|i| 
    (array_length - i).times{|j|
        if yield(array[i], array[i + j + 1]) 
          temp = array[i]
          array[i] = array[i + j + 1]
          array[i + j + 1] = temp
        end
    }
  }
  return array
end
array = [6,3,5,4,1,7,2,8]
p insertion_sort(array) { |i,j|
i > j
}
p insertion_sort(array) { |i,j|
i < j
}

