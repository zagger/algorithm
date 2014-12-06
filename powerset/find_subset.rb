
def find_subset_two a, m=2
  subset = Hash.new{|x| Array.new}
  a.each do |x|
    a.each do |y|
      if x != y
        subset[[x, y].sort] = [x, y].sort
      end
    end
  end
  subset
end


def find_subset a, m, set
  if m == 0
    p set
  else
    (a.length-m+1).times do |i|
      set << a[i]
      find_subset a[(i+1)..(a.length-1)], m-1, set
      set.pop
    end
  end
end

subset = Hash.new{|x| Array.new}
n = 20
m = 10

a = []

n.times do |i|
  a << i
end

p "set is #{a}"
p "subset length is #{m}"

set = []

find_subset a, m, set


