def merge(left,right,array)
  nl = left.length
  nr = right.length
  i = 0
  j = 0
  k = 0

  while i < nl and j < nr
    if left[i] >= right[j]
      array[k] = left[i]
      k = k + 1
      i = i + 1
    else
      array[k] = right[j]
      k = k + 1
      j = j + 1
    end
  end
  while i < nl
    array[k] = left[i]
    i = i + 1
    k = k + 1
  end
  while j < nr
    array[k] = right[j]
    j = j + 1
    k = k+1
  end    
  return array
end


def merge_sort(array)
  n = array.length
  return if n < 2
  mid = n / 2
  left = [ ]
  right = [ ]
  # for i in 0..(mid - 1)
  #   left[i] = array[i]
  # end
  # for i in mid..(n-1)
  #   right[i - mid] = array[i]
  # end
  left = array[0..(mid - 1)]
  right = array[mid..(n-1)]
  merge_sort(left)
  merge_sort(right)
  merge(left,right,array)
  return array
end

array = [8,3,6,2,7,4,5,1]

p merge_sort(array)





 
# left = [2,3,6,8]
# right = [1,4,5,7]

# p merge(left,right,array)