
class Square
	def main
		square = Array.new(3) {Array.new(3){0}}
		recursive_judge square
		p judge square
	end

	def recursive_judge square
		k = 1
		3.times do |i|
			3.times do |j|
				square[i][j] = k; k += 1
			end
		end
	end

	def judge square
		return false if sum_horizon(square).detect { |sum| 15 < sum } 
		return false if sum_vartical(square).detect { |sum| 15 < sum } 
		return true
	end

	def sum_horizon square
		[*0..2].map { |i| square[i].inject(:+) }
	end

	def sum_vartical square
		[*0..2].map { |i| tmp = []; 3.times { |j| tmp << square[j][i] }; tmp.inject(:+) }
	end

	def sum_slant square
	end
end

Square.new.main
