
class Fibo
  def initialize
  end

  def findFiboLogn n
  end

  def power a, n
    result = a
    while 1
      if n == 0
        break
      elsif n%2 == 0
        result = result*result
        n = n/2
      else
        result = result*a
        n = n-1
      end
    end
    result
  end

  def findFibo n
    if n == 0 or n == 1 or n ==2
      return 1
    end
    array = []
    array << 1
    array << 1
    (n-2).times do |i|
      array << array[i] + array[i+1]
    end
    array[n-1]
  end
end

#p Fibo.new.findFibo 7
#p Fibo.new.recursivePower 2, 2
p Fibo.new.power 2, 3
