
def hotcake a
  if a.size == 1 then return a end
  min = a.min
  max = a.max
  last = a.size-1
  loop do
    case a[0] - a[1]
    when -1#昇順
      i = up_search a
      if i == last then return a end
      if reverse? a[0..i], min, max
        _a = a[0]
        reverse! a, i
      end
      reverse! a, a.index(_a)

    when 1#降順
      i = down_search a
      if i == last
        reverse! a, i
        return a
      end
      if reverse? a[0..i], min, max
        reverse! a, i
      end
      reverse! a,
    else#単独
    end
  end
end

def reverse? a, min, max
  if a[0] == min || a[0] == max || a[a.size-1] != min || a[a.size-1] != max || a.size == 1
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

a = (1..10).sort_by{rand}

hotcake a

def reverse a, i, min, max
  if reverse? a[0..i], min, max
    _a = a[0]
    case a[0] - a[1]
    when -1#昇順
      reverse! a, i
      reverse! a, a.index(_a-1)
    when 1#降順
      reverse! a, i
      reverse! a, a.index(_a+1)
    end
  end
  reverse! a, 
end

