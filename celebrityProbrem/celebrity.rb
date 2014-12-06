
class SolvingCelebrity
	def solving n, famous_name
		famous_person = Person.new famous_name, 'myself'
		celebrity = Celebrity.new n, famous_person
		celebrity.start
	end
end

class Celebrity
	def initialize n, famous_person
		@famous_person = famous_person
		@persons = make_normal_persons n-1
		@persons << famous_person
	end

	def make_normal_persons n
		[*0..(n-1)].map{|i| Person.new i, @famous_person}
	end

	def num
		@persons.size
	end

	def start
		p "solving #{num} celebrity probrem"
		p "famous person is #{(find @persons).name}"
	end

	def find persons
		return persons[0] if persons.size == 1
		if persons[0].knowing? persons[1]
			p "#{persons[0].name} knows #{persons[1].name}"
			find persons-[persons[0]]
		else
			p "#{persons[0].name} doesn't know #{persons[1].name}"
			find persons-[persons[1]]
		end
	end
end

class Person
	attr_reader :name
	def initialize name, know_person
		@name = name
		@know_person = know_person
	end

	def knowing? person
		return true if person == @know_person;false
	end
end

sc = SolvingCelebrity.new
sc.solving 10, 'jack'

