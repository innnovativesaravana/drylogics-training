def merge(left,right,array,&block)
  nl = left.length
  nr = right.length
  i = 0
  j = 0
  k = 0
  while i < nl and j < nr
    if block.call(left[i],right[j])
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

def merge_sort(array,&block)
  n = array.length
  return if n < 2
  mid = n / 2
  left = [ ]
  right = [ ]
  left = array[0..(mid - 1)]
  right = array[mid..(n-1)]
  merge_sort(left,&block)
  merge_sort(right,&block)
  merge(left,right,array,&block)
  return array
end
array = [8,3,6,2,7,4,5,1]
p merge_sort(array){|a,b|
  a <= b
}

p merge_sort(array){|a,b|
  a >= b
}