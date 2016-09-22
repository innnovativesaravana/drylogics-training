def msort(array)
  n = array.length - 1
  temp = n / 2
  return array if n == 1
  l1 = array[0..temp]
  l2 = array[(temp + 1)..n]
  l1 = msort(l1)
  l2 = msort(l2)
  return l1,l2
end





array = [4,6,3,8]
p msort(array)