
def hotcake a
  if a.size == 1 then return a end
  last = a.size-1
  loop do
    i = up_search a
    j = down_search a
    if i == last then return a end
    if j == last then reverse! a, last; return a end
    if j < i#昇順
      if a[0] == a.min then reverse2 a, i, 1
      else reverse2 a, i, -1;exit end
    elsif i < j#降順
      if a[0] == a.max then reverse2 a, j, -1
      else reverse2 a, j, 1 end
    else#単独
      if a[0] == a.min then reverse2 a, 0, 1
      elsif a[0] == a.max then reverse2 a, 0, -1
      else reverse2 a, 0, 1 end
    end
  end
end

def reverse1 a, p#when ¬(min or max) ... any
  l = a.index(a[0]+p)
  reverse! a, l-1
end

def reverse2 a, k, p#when min ... any or max ... any
  l = a.index(a[k]+p)
  p a[k]+p
  p k
  p l
  p "-------------"
    p a
  reverse! a, l
    p a
  reverse! a, l-k-1
    p a
  p "-------------"
end
#
#min ... max
#
#min ... any
#any ... max
#
#
#max ... min
#
#max ... any
#any ... min
#
#any ... any
#
def reverse? a, min, max
  if a[0]==min||a[0]==max||a.size==1||(a.last != min && a.last != max)
    return false
  else#if a[a.size-1] != min && a[a.size-1] != max
    return true
  end
end

def reverse! a, i
  a[0..i].reverse.each_with_index do |a_i, i|
    a[i] = a_i
  end
end

def up_search a
  (a.size-1).times do |i|
    if a[i] != a[i+1] - 1 then return i end
  end
  return a.size-1
end

def down_search a
  (a.size-1).times do |i|
    if a[i] != a[i+1] + 1 then return i end
  end
  return a.size-1
end

#a = [3,2,1,6,5,4]
#a = [1,2,3,6,5,4]

a = (1..5).sort_by{rand}
a = [1, 5, 3, 4, 2]
p hotcake a

