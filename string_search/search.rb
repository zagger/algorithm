

def string_search t, s
  if s.size > t.size then exit end

  t.size.times do |i|
    if t[i] == s[0]
      s.size.times do |j|
        if t[i+j] == s[j]
          if j == s.size-1
            return i
          end
        else
          break
        end
      end
    end
  end
end

def string_k_serch t, s, k
  if s.size > t.size then exit end

  t.size.times do |i|
    if t[i] == s[0] and (d_h t[i, s.size], s) <= k then return i end
  end
end

def d_h t, s
  count = 0
  t.size.times do |i|
    if t[i] != s[i] then count += 1 end
  end
  count
end

s = ['a','b','c','d','c','c','d','e','f']
t = ['d','e','f']

p string_k_serch s, t, 2
exit


p string_serch s, t


