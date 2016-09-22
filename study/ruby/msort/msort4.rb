def merge(left,right,array,ascending)
  nl = left.length
  nr = right.length
  i = 0
  j = 0
  k = 0
  while i < nl and j < nr
    if ((left[i] <= right[j]) and ascending) or (left[i] >= right[j] and (ascending == false))
      array[k] = left[i]
      i += 1
    else
      array[k] = right[j]
      j += 1
    end
    k += 1
  end
  while i < nl
    array[k] = left[i]
    i += 1
    k += 1
  end
  while j < nr
    array[k] = right[j]
    j += 1
    k += 1
  end    
  return array
end

def merge_sort(array,ascending)
  n = array.length
  return if n < 2
  mid = n / 2
  left = [ ]
  right = [ ]
  left = array[0..(mid - 1)]
  right = array[mid..(n-1)]
  merge_sort(left,ascending)
  merge_sort(right,ascending)
  merge(left,right,array,ascending)
  return array
end
array = [8,3,6,2,7,4,5,1]
p merge_sort(array,true)
p merge_sort(array,false)
