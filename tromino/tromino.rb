
require 'matrix'

class Array
	def vec
		Vector.elements(self)
	end
end

class SolvingTromino
	def solving n
		tr = Board.new n
		tr.start
	end
end

class Board
	def initialize n
		@size = 2**n	
		@lack = [rand(@size), rand(@size)].vec
		@trominoes = []
		@i = 2
	end

	def start
		show_init
		div Block.new([0,0].vec, @size, @lack)
		show_trominoes
	end

	def div block
		if block.size == 1 then return end
		tr = Tromino.new @i
		tr.coordinates = block.selects
		@trominoes << tr
		show_trominoes
		@i += 1
		block.div_blocks.each do |block|
			div block
		end
	end

	def show_init
		p '-------init-------'
		@size.times do |i|
			tmp = []
			@size.times do |j|
				if [i, j].vec == @lack then tmp << 1 else tmp << 0 end
			end
			p tmp
		end
	end

	def show_trominoes
		p '-------result-------'
		tmp = Array.new(@size){Array.new(@size)}	
		@trominoes.each do |tromino|
			tromino.coordinates.each do |c|
				tmp[c[0]][c[1]] = tromino.name
			end
		end
		tmp[@lack[0]][@lack[1]] = 1
		tmp.each do |i|
			p i
		end
	end
end

class Block
	attr_reader :centers, :selects, :size
	@@dir = [[0,0], [1,0], [0,1], [1,1]].map(&:vec)

	def initialize base, size, lack
		@base = base
		@size = size
		@lack = lack
		@centers = get_centers
		@selects = get_selects @centers
		@another = @centers - @selects
	end

	def div_blocks
		@centers.map.with_index do |v, i|
			if vaild? v
				Block.new(next_bases[i], @size/2, v)
			else
				Block.new(next_bases[i], @size/2, @lack)
			end
		end
	end

private
	def get_centers
		@@dir.map{|v| v + [@size/2-1, @size/2-1].vec + @base}
	end

	def get_selects centers
		selected = centers.select{ |c| vaild? c }
		return selected - [selected[0]] if selected.size == 4; selected
	end

	def vaild? c
		if @size == 2 && c == @lack
			return false
		end
		next_bases.each do |base|
			if base[0] <= c[0] && c[0] <= @size/2-1+base[0] && base[1] <= c[1] && c[1] <= @size/2-1+base[1] && base[0] <= @lack[0] && @lack[0] <= @size/2-1+base[0] && base[1] <= @lack[1] && @lack[1] <= @size/2-1+base[1]
				return false
			end
		end
		true
	end

	def next_bases
		[@base, [@base[0]+@size/2,@base[1]].vec, [@base[0],@base[1]+@size/2].vec, [@base[0]+@size/2,@base[1]+@size/2].vec]
	end
end

class Tromino
	attr_accessor :coordinates, :name
	def initialize name
		@coordinates = []
		@name = name
	end
end

st = SolvingTromino.new
st.solving 2

