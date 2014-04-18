system('cls')

class Person
	attr_accessor :name
	attr_accessor :caffeine_level
	def initialize(name, caffeine_level = 0)
		@name = name
		@caffeine_level = caffeine_level
	end
	def run
		puts "*Run Run Run*"
		return self
	end
	def scream
		puts "AHHHHHHHHHHHHH!"
		return self
	end
	def drink_coffee
		@caffeine_level += 10
		return self
	end

end

class PowerRanger < Person
	def initialize (name, caffeine_level = 10, strength = 1, color = "black")
		super(name, caffeine_level)
		@strength = strength
		@color = color
	end
	def punch(person)
		if @strength > 5
			puts "#{person.name} flips through air!"
			person.caffeine_level -= 2
		end
		person.scream
	end
	def rest
		puts "I'm taking a break"
	end
	def use_megazord(person)
		person.run.scream
		person.caffeine_level = 0
	end
end

class EvilNinja < Person
	def initialize (name, strength = 0, evilness = 10)
		super(name)
		@strength = strength
		@evilness = evilness
	end
	def punch(person)
		if @strength > 5
			puts "#{person.name} flips through air!"
			person.caffeine_level -= 2
		end
		person.scream
	end
	def cause_mayhem(person)
		person.caffeine_level = 0
	end
end

joe = Person.new("Joe", 20)
joe.run.scream.drink_coffee
puts joe.caffeine_level

newbie = PowerRanger.new("Newbie")
tron = PowerRanger.new("Tron", 50, 10, "orange")

newbie.rest
newbie.punch(joe)
puts joe.caffeine_level
tron.punch(joe)
puts joe.caffeine_level

tron.use_megazord(joe)
puts joe.caffeine_level
