
def hotcake a
  if a.size == 1 then return a end
  last = a.size-1
  loop do
    i = up_search a
    j = down_search a
    if i == last then return a end
    if j == last then reverse! a, last; return a end
    if j < i then reverse a, i, -1#昇順
    elsif i < j then reverse a, j, 1#降順
    else#単独
      if a[0] == a.min then reverse a, 0, -1
      else reverse a, 0, 1 end
    end
  end
end

def reverse a, k, p
  if reverse? a[0..k], a.min, a.max
    _a = a[0]
    reverse! a, k
    l = a.index(_a+p)
    reverse! a, l
  else
    l = a.index(a[k]-p)
    reverse! a, l
  end
  reverse! a, l-k-1
end

def reverse? a, min, max
  if a[0]==min||a[0]==max||a.size==1||(a.last != min && a.last != max)
    return false
  else return true end
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

a = (1..100).sort_by{rand}
p hotcake a

