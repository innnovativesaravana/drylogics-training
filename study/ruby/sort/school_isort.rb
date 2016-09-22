

def insertion_sort(array)
  array_length = array.length - 1
  array_length.times{|i| 
    (array_length - i).times{|j|
        if yield(array[i][0], array[i + j + 1][0]) 
          temp = array[i]
          array[i] = array[i + j + 1]
          array[i + j + 1] = temp
        end
    }
  }
  return array
end
array = [["sarav",80],["mani",40],["anjal",60],["san",50]]
p insertion_sort(array) { |i,j|
i > j
}
p insertion_sort(array) { |i,j|
i < j
}










