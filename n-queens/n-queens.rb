
require 'matrix'

class Nqueens < Struct.new(:n)
	def start
		p "sloving #{n} queens problem"
		search root
	end

	def root
		Node.new Array.new(n){Array.new(n){Hash.new}}, 0
	end

	def search node
		if node.finish? then node.show_queens;return end
		preds = node.get_preds
		if !preds.empty? then preds.each{|n| search n} end
	end
end

class Node
	def initialize arrays, c_row
		@arrays = arrays
		@c_row = c_row
		@n = arrays.size
	end

	def get_preds
		get_next - [nil]
	end

	def get_next
		[*0..(@n-1)].map do |i| 
			Node.new( new_arrays(i, @c_row) , @c_row+1) if !@arrays[i][@c_row][:atckd]
		end
	end

	def new_arrays i, j
		n_ars = @arrays.map{|array| array.map(&:dup)}#deep copy
		set_atk_rng n_ars, i, j
		n_ars
	end

	def set_atk_rng n_ars, i, j
		n_ars[i][j][:queen] = true
		vectors = [[0,1],[1,0],[1,1], [0,-1],[-1,0],[-1,-1], [1,-1],[-1,1]]#[行,列],8要素
		vectors.each do |vector| 
			set n_ars, Vector.elements([i,j]), Vector.elements(vector)
		end
	end

	def set n_ars, c_v, a_v
		if safe? c_v 
			n_ars[c_v[0]][c_v[1]][:atckd] = true
			set(n_ars, c_v+a_v, a_v)#スカラー倍
		end
	end

	def safe? c_v
		return false if c_v[0] < 0 || c_v[1] < 0 || c_v[0] >= @n || c_v[1] >= @n;true
	end

	def finish?
		return true if @c_row == @n;false
	end

	def show_queens
		@arrays.each do |array|
			tmp =[]
			array.each do |e|
				if e[:queen] == true then tmp << 1 else tmp << 0 end
			end
			p tmp
		end
		p '--------------------'
	end
end

nq = Nqueens.new(8)
nq.start

