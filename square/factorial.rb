
a = [0,1,2]

result = Array.new(a.size) {[]}



def recursive a, result
	a.each do |i|
		result[j] << i
		if a - result[j] then recursive( a - result[j], result) end
	end
end

recursive a, result

p result
