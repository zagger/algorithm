
#culculation value is O(2^n)!

def power_set a#return Array[Array[Int]]
  p_set = Array.new{|x| Array.new}
  (2**a.length).times do |i|
    array = []
    i.to_s(2).length.times do |j|
      if i.to_s(2).reverse[j] == "1"
        array << a[j]
      end
    end
    p_set << array
  end
  p_set
end

def pickup_sets p_set, l
  l_set = Array.new{|x| Array.new}
  p_set.each do |a|
    if a.length == l
      l_set << a
    end
  end
  l_set
end

n = 15
l = 2
a = []
n.times do |i|
  a << i
end

p_set = power_set a
p_2_set = pickup_sets p_set, l

p p_2_set.length == (n*(n-1))/2

