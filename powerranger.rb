system('clear')

class Person
	attr_accessor :name
	attr_accessor :caffeine_level
	def initialize(name, caffeine_level = 50)
		@name = name
		@caffeine_level = caffeine_level
	end
	def run
		puts "#{@name} runs away"
		return self
	end
	def scream
		scream_arr = ["AHHHHHHH", "YIKES", "NOOOOO"]
		puts "#{@name} yells #{scream_arr[rand(0..2)]}!"
		return self
	end
	def drink_coffee
		@caffeine_level += rand(10..20)
		return self
	end

end

class PowerRanger < Person
	def initialize (name, color = "Yellow", strength = 1, caffeine_level = 75)
		super(name, caffeine_level)
		@strength = strength
		@color = color
	end
	def punch(person)
		puts "#{@name} punches #{person.name}"
		if @strength > 5
			puts "#{person.name} flips through air!"
			person.caffeine_level -= rand(10..20)
			if person.caffeine_level < 0
				puts "#{person.name} has run out of caffeine :("
				person.caffeine_level = 0
			end
		end
		person.scream
	end
	def rest
		puts "#{@name} is taking a break"
	end
	def use_megazord(person)
		puts "#{@name} charges up megazord move"
		person.run.scream
		person.caffeine_level -= rand (20..40)
		if person.caffeine_level < 0
			puts "#{person.name} has run out of caffeine :("
			person.caffeine_level = 0
		end
	end
end

class EvilNinja < Person
	def initialize (name, strength = 1, evilness = 10)
		super(name)
		@strength = strength
		@evilness = evilness
	end
	def punch(person)
		puts "#{@name} punches #{person.name}"
		if @strength > 5
			puts "#{person.name} flips through air!"
			person.caffeine_level -= rand(10..20)
			if person.caffeine_level < 0
				puts "#{person.name} has run out of caffeine :("
				person.caffeine_level = 0
			end
		end
		person.scream
	end
	def cause_mayhem(person)
		person.caffeine_level = 0
		puts "#{@name} has drained #{person.name}'s caffeine level to zero..."
	end
end

joe = Person.new("Joe")
joe.run.scream.drink_coffee
puts joe.caffeine_level

newbie = PowerRanger.new("Newbie")
tron = PowerRanger.new("Tron", "Red", 8)

newbie.rest
newbie.punch(joe)
puts joe.caffeine_level
tron.punch(joe)
tron.punch(joe)

puts joe.caffeine_level

tron.use_megazord(joe)
puts joe.caffeine_level

roku = EvilNinja.new("Roku")
roku.punch(tron)
