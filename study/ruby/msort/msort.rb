def msort(array)

  a = sub(array)
  a1 = sub(a[0])
  a2 = sub(a[1])
  a11 = sub(a1[0])
  a12 = sub(a1[1])
  a21 = sub(a2[0])
  a22 = sub(a2[1])
  c =[ ] 
  c = a11,a12,a21,a22
  return c
end



def sub(array)
  n = array.length - 1
  temp = n / 2
  a1 = array[0..temp]
  a2 = array[(temp + 1)..n]
  return a1,a2
end










array = [4,6,3,8,2,7,1,5]
p msort(array)