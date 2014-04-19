system('clear')

module PunchMove
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
end



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
	include PunchMove
	def initialize (name, color = "Yellow", strength = 1, caffeine_level = 75)
		super(name, caffeine_level)
		@strength = strength
		@color = color
	end
	# def punch(person)
	# 	puts "#{@name} punches #{person.name}"
	# 	if @strength > 5
	# 		puts "#{person.name} flips through air!"
	# 		person.caffeine_level -= rand(10..20)
	# 		if person.caffeine_level < 0
	# 			puts "#{person.name} has run out of caffeine :("
	# 			person.caffeine_level = 0
	# 		end
	# 	end
	# 	person.scream
	# end
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
	include PunchMove
	def initialize (name, strength = 1, evilness = 10)
		super(name)
		@strength = strength
		@evilness = evilness
	end
	# def punch(person)
	# 	puts "#{@name} punches #{person.name}"
	# 	if @strength > 5
	# 		puts "#{person.name} flips through air!"
	# 		person.caffeine_level -= rand(10..20)
	# 		if person.caffeine_level < 0
	# 			puts "#{person.name} has run out of caffeine :("
	# 			person.caffeine_level = 0
	# 		end
	# 	end
	# 	person.scream
	# end
	def cause_mayhem(person)
		person.caffeine_level = 0
		puts "#{@name} has drained #{person.name}'s caffeine level to zero..."
	end
end

def fight_scene(ranger1, ranger2, ninja1, ninja2, person1, person2)
	puts "#{ninja1.name} and #{ninja2.name} confront #{person1.name} and #{person2.name} in a back alley"
	person1.scream
	person2.scream
	person1.run
	ninja1.punch(person2)
	ninja2.punch(person1)
	puts "Don't fear! #{ranger1.name} and #{ranger2.name} have arrived to deal some justice"
	ranger2.punch(ninja1)
	ranger1.punch(ninja2)
	ranger2.punch(ninja2)
	ranger1.punch(ninja1)
	ranger2.rest
	ninja2.cause_mayhem(person1)
	ranger1.use_megazord(ninja1)
	ranger2.use_megazord(ninja2)
	puts "And the battle is over!"
end




joe = Person.new("Joe")
mary = Person.new("Mary")

tron = PowerRanger.new("Tron", "Red",6)
galaxy = PowerRanger.new("Galaxy", "Green",7)

zed = EvilNinja.new("Zed", 3)
ted = EvilNinja.new("Ted", 6)

fight_scene(tron, galaxy, zed, ted, joe, mary)
