
# *** TODOs - critical:  ***
#
#create all derived attributes (and add to class Character)
#
#nested race rolls that affect attributes (like PSH attrib bonuses)
#
#Q: reorder so attrib rolls come before race? 
#
#Q: implement modules so that race-dependent specifics only load when race = relevant...?
#
#Determine wealth level and update (add to Class character)
#
#Skill rolls: skills as class? or hash?
#
#Output all results to a nicely-formatted .txt file (FUTURE - PDF??)
# like this: 
#https://stackoverflow.com/questions/2777802/how-to-write-to-file-in-ruby
# and
# https://www.codecademy.com/articles/writing-to-file-ruby
#
#UNTIL bestial human subtypes built, just a page reference as a placeholder for your bestial human subtype 
#
#
# *** TODOs - nice to have:  ***
#Character name generator
#
#Class = weapon: value, range, damage, name (or class = attack?) 
#
#Build hash for ATTACKS (separate from WEAPONS - not always equipment-dependent) to output on character sheet
#
#Build hash to hold all inventory items (or array?) -- include all possessions based on wealth level
#
#Build hash to hold mutations
#
#add all other rolls to character creation (handedness, hair color, eye color, height, weight, age, etc.)
#
#implement player level (beginner, intermed, expert) and expanded race roll tables
#
# Ask for name (gets.chomp).to_s or offer to generate one from random list (loaded from Mutant Epoch website)
#
#Add references to Core Rulebook page# for future lookups (and reference)
#
#Add character hometown (maybe for NPC only?) based on the tables in the Pitford book...
#
#Add "flavor text" for race and class from the Core book? That would add a TON of text... maybe not terribly useful. Maybe just a page reference instead?
#
#Implement rolls for bestial human subtype
#
# create die roll classes and call them by die.d6 or die.d100 ???
# see https://gist.github.com/cnocon/6753028
# for example die rolling script

class Character
  def initialize(race, charactername, caste, endurance, strength, agility, accuracy, intelligence, willpower, perception, appearance, outfittingcode)
    
    def race 
      @race
    end
    
    def charactername
      @charactername
    end
    
    def caste
    @caste
      def to_s
      "#{caste}"
      end
    end
    
    def endurance
		@endurance
		end
		
		def strength
		@strength
		end
		
		def agility
		@agility
		end
		
		def accuracy
		@accuracy
		end
		
		def intelligence
		@intelligence
		end
		
		def willpower
		@willpower
		end
		
		def perception
		@perception
		end
		
		def appearance
		@appearance
		end
		
		def outfittingcode
		@outfittingcode
		end
		
  end
end


# this bit accurately rolls and outputs race properly! 
# also updates character race value appropriately!!!

raceroll = (rand(1..100))
	


	if ((0 < raceroll) && (raceroll <= 32))
    		@race = "Pure Stock Human"

    	elsif
    		@raceroll == 33
      	@race = "Clone, Comfort"
    	elsif
    		@raceroll == 34
    		@race = "Clone, Labor"
    	elsif
    		@raceroll == 35
    		@race = "Clone, Military"
    	elsif
    		@raceroll == 36
    		@race = "Clone, Pleasure"
    	elsif
    		@raceroll == 37
    		@race =  "Bioreplica, Industrial"
    	elsif
    		@raceroll == 38
    		@race = "Bioreplica, Clerical"
    	elsif
    		@raceroll == 39
    		@race =  "Bioreplica, Infltration"
    	elsif
    		@raceroll == 40
    		@race = "Bioreplica, Battle"
    	elsif
    		@raceroll == 41
    		@race = "Trans-Human"
    	elsif
    		((41 < raceroll) && (raceroll <= 55))
    		@race = "Cyborg"
    	elsif
    		((55 < raceroll) && (raceroll <= 61))
    		@race = "Bestial Human"
    	elsif
    		((61 < raceroll) && (raceroll <= 68))
    		@race = "Ghost Mutant"
    	elsif
    		((68 < raceroll) && (raceroll <= 87))
    		@race = "Mutant, Mild"
    	elsif
    		((87 < raceroll) && (raceroll <= 98))
    		@race = "Mutant, Typical"
    	elsif
    		((98 < raceroll) && (raceroll <= 100))
    		@race = "Mutant, Severe"

end
puts "Your roll for character race is #{raceroll}"
puts "Your character race is #{@race}"

# next step: rolling attributes

# first attribute: endurance
# AND it's fucking working!!!
# todo: if possible, create a "rolls" class to store all rolls so
# we only need a single lookup table for roll results. Should be easy.

endroll = (rand(1..100))

puts "Your Endurance roll is #{endroll}"
	
if @endroll == 1
	 @endurance = (rand(1..10))
	  
  elsif
    @endroll == 2
    @endurance = 11
  elsif
    @endroll == 3
    @endurance = 12
  elsif
    @endroll == 4
    @endurance = 13
  elsif
    @endroll == 5
    @endurance = 14
  elsif
    ((5 < endroll) && (endroll <= 7))
    @endurance = 15
  elsif
    ((7 < endroll) && (endroll <= 9))
    @endurance = 16
  elsif
    ((9 < endroll) && (endroll <= 11))
    @endurance = 17
  elsif
    ((11 < endroll) && (endroll <= 14))
    @endurance = 18
  elsif
    ((14 < endroll) && (endroll <= 17))
    @endurance = 19
  elsif
    ((17 < endroll) && (endroll <= 21))
    @endurance = 20
  elsif
    ((21 < endroll) && (endroll <= 25))
    @endurance = 21
  elsif
    ((25 < endroll) && (endroll <= 30))
    @endurance = 22
  elsif
    ((30 < endroll) && (endroll <= 35))
    @endurance = 23
  elsif
    ((35 < endroll) && (endroll <= 37))
    @endurance = 24
  elsif
    ((37 < endroll) && (endroll <= 39))
    @endurance = 25
  elsif
    ((39 < endroll) && (endroll <= 41))
    @endurance = 26
  elsif
    ((41 < endroll) && (endroll <= 43))
    @endurance = 27
  elsif
    ((43 < endroll) && (endroll <= 45))
    @endurance = 28
  elsif
    ((45 < endroll) && (endroll <= 47))
    @endurance = 29
  elsif
    ((47 < endroll) && (endroll <= 49))
    @endurance = 30
  elsif
    ((49 < endroll) && (endroll <= 51))
    @endurance = 31
  elsif
    ((51 < endroll) && (endroll <= 53))
    @endurance = 32
  elsif
    ((53 < endroll) && (endroll <= 55))
    @endurance = 33
  elsif
    ((55 < endroll) && (endroll <= 57))
    @endurance = 34
  elsif
    ((57 < endroll) && (endroll <= 59))
    @endurance = 35
  elsif
    ((59 < endroll) && (endroll <= 61))
    @endurance = 36
  elsif
    ((61 < endroll) && (endroll <= 63))
    @endurance = 37
  elsif
    ((63 < endroll) && (endroll <= 65))
    @endurance = 38
  elsif
    ((65 < endroll) && (endroll <= 67))
    @endurance = 39
  elsif
    ((67 < endroll) && (endroll <= 69))
    @endurance = 40
  elsif
    ((69 < endroll) && (endroll <= 90))
    @endurance = (rand(1..20)) + 40
  elsif
    ((90 < endroll) && (endroll <= 96))
    @endurance = (rand(1..20)) + 60
  elsif
    ((96 < endroll) && (endroll <= 99))
    @endurance = (rand(1..20)) + 80
  elsif
    @endroll == 100
    @endurance = (rand(1..20)) + 100
end 

puts "Your tentative Endurance value is #{@endurance}"

# HOLY FUCKING SHIT all the above is working so far...
# now onto strength


strroll = (rand(1..100))

puts "Your strength roll is #{strroll}"
	
if @strroll == 1
	 @strength = (rand(1..10))
	  
  elsif
    @strroll == 2
    @strength = 11
  elsif
    @strroll == 3
    @strength = 12
  elsif
    @strroll == 4
    @strength = 13
  elsif
    @strroll == 5
    @strength = 14
  elsif
    ((5 < strroll) && (strroll <= 7))
    @strength = 15
  elsif
    ((7 < strroll) && (strroll <= 9))
    @strength = 16
  elsif
    ((9 < strroll) && (strroll <= 11))
    @strength = 17
  elsif
    ((11 < strroll) && (strroll <= 14))
    @strength = 18
  elsif
    ((14 < strroll) && (strroll <= 17))
    @strength = 19
  elsif
    ((17 < strroll) && (strroll <= 21))
    @strength = 20
  elsif
    ((21 < strroll) && (strroll <= 25))
    @strength = 21
  elsif
    ((25 < strroll) && (strroll <= 30))
    @strength = 22
  elsif
    ((30 < strroll) && (strroll <= 35))
    @strength = 23
  elsif
    ((35 < strroll) && (strroll <= 37))
    @strength = 24
  elsif
    ((37 < strroll) && (strroll <= 39))
    @strength = 25
  elsif
    ((39 < strroll) && (strroll <= 41))
    @strength = 26
  elsif
    ((41 < strroll) && (strroll <= 43))
    @strength = 27
  elsif
    ((43 < strroll) && (strroll <= 45))
    @strength = 28
  elsif
    ((45 < strroll) && (strroll <= 47))
    @strength = 29
  elsif
    ((47 < strroll) && (strroll <= 49))
    @strength = 30
  elsif
    ((49 < strroll) && (strroll <= 51))
    @strength = 31
  elsif
    ((51 < strroll) && (strroll <= 53))
    @strength = 32
  elsif
    ((53 < strroll) && (strroll <= 55))
    @strength = 33
  elsif
    ((55 < strroll) && (strroll <= 57))
    @strength = 34
  elsif
    ((57 < strroll) && (strroll <= 59))
    @strength = 35
  elsif
    ((59 < strroll) && (strroll <= 61))
    @strength = 36
  elsif
    ((61 < strroll) && (strroll <= 63))
    @strength = 37
  elsif
    ((63 < strroll) && (strroll <= 65))
    @strength = 38
  elsif
    ((65 < strroll) && (strroll <= 67))
    @strength = 39
  elsif
    ((67 < strroll) && (strroll <= 69))
    @strength = 40
  elsif
    ((69 < strroll) && (strroll <= 90))
    @strength = (rand(1..20)) + 40
  elsif
    ((90 < strroll) && (strroll <= 96))
    @strength = (rand(1..20)) + 60
  elsif
    ((96 < strroll) && (strroll <= 99))
    @strength = (rand(1..20)) + 80
  elsif
    @strroll == 100
    @strength = (rand(1..20)) + 100
end 

puts "Your tentative Strength value is #{@strength}"

# agility

agiroll = (rand(1..100))

puts "Your agility roll is #{agiroll}"

if @agiroll == 1
	 @agility = (rand(1..10))
  elsif
    @agiroll == 2
    @agility = 11
  elsif
    @agiroll == 3
    @agility = 12
  elsif
    @agiroll == 4
    @agility = 13
  elsif
    @agiroll == 5
    @agility = 14
  elsif
    ((5 < agiroll) && (agiroll <= 7))
    @agility = 15
  elsif
    ((7 < agiroll) && (agiroll <= 9))
    @agility = 16
  elsif
    ((9 < agiroll) && (agiroll <= 11))
    @agility = 17
  elsif
    ((11 < agiroll) && (agiroll <= 14))
    @agility = 18
  elsif
    ((14 < agiroll) && (agiroll <= 17))
    @agility = 19
  elsif
    ((17 < agiroll) && (agiroll <= 21))
    @agility = 20
  elsif
    ((21 < agiroll) && (agiroll <= 25))
    @agility = 21
  elsif
    ((25 < agiroll) && (agiroll <= 30))
    @agility = 22
  elsif
    ((30 < agiroll) && (agiroll <= 35))
    @agility = 23
  elsif
    ((35 < agiroll) && (agiroll <= 37))
    @agility = 24
  elsif
    ((37 < agiroll) && (agiroll <= 39))
    @agility = 25
  elsif
    ((39 < agiroll) && (agiroll <= 41))
    @agility = 26
  elsif
    ((41 < agiroll) && (agiroll <= 43))
    @agility = 27
  elsif
    ((43 < agiroll) && (agiroll <= 45))
    @agility = 28
  elsif
    ((45 < agiroll) && (agiroll <= 47))
    @agility = 29
  elsif
    ((47 < agiroll) && (agiroll <= 49))
    @agility = 30
  elsif
    ((49 < agiroll) && (agiroll <= 51))
    @agility = 31
  elsif
    ((51 < agiroll) && (agiroll <= 53))
    @agility = 32
  elsif
    ((53 < agiroll) && (agiroll <= 55))
    @agility = 33
  elsif
    ((55 < agiroll) && (agiroll <= 57))
    @agility = 34
  elsif
    ((57 < agiroll) && (agiroll <= 59))
    @agility = 35
  elsif
    ((59 < agiroll) && (agiroll <= 61))
    @agility = 36
  elsif
    ((61 < agiroll) && (agiroll <= 63))
    @agility = 37
  elsif
    ((63 < agiroll) && (agiroll <= 65))
    @agility = 38
  elsif
    ((65 < agiroll) && (agiroll <= 67))
    @agility = 39
  elsif
    ((67 < agiroll) && (agiroll <= 69))
    @agility = 40
  elsif
    ((69 < agiroll) && (agiroll <= 90))
    @agility = (rand(1..20)) + 40
  elsif
    ((90 < agiroll) && (agiroll <= 96))
    @agility = (rand(1..20)) + 60
  elsif
    ((96 < agiroll) && (agiroll <= 99))
    @agility = (rand(1..20)) + 80
  elsif
    @agiroll == 100
    @agility = (rand(1..20)) + 100
end 

puts "Your tentative Agility value is #{@agility}"

# accuracy

accroll = (rand(1..100))

puts "Your accuracy roll is #{accroll}"

if @accroll == 1
	 @accuracy = (rand(1..10))
	  
  elsif
    @accroll == 2
    @accuracy = 11
  elsif
    @accroll == 3
    @accuracy = 12
  elsif
    @accroll == 4
    @accuracy = 13
  elsif
    @accroll == 5
    @accuracy = 14
  elsif
    ((5 < accroll) && (accroll <= 7))
    @accuracy = 15
  elsif
    ((7 < accroll) && (accroll <= 9))
    @accuracy = 16
  elsif
    ((9 < accroll) && (accroll <= 11))
    @accuracy = 17
  elsif
    ((11 < accroll) && (accroll <= 14))
    @accuracy = 18
  elsif
    ((14 < accroll) && (accroll <= 17))
    @accuracy = 19
  elsif
    ((17 < accroll) && (accroll <= 21))
    @accuracy = 20
  elsif
    ((21 < accroll) && (accroll <= 25))
    @accuracy = 21
  elsif
    ((25 < accroll) && (accroll <= 30))
    @accuracy = 22
  elsif
    ((30 < accroll) && (accroll <= 35))
    @accuracy = 23
  elsif
    ((35 < accroll) && (accroll <= 37))
    @accuracy = 24
  elsif
    ((37 < accroll) && (accroll <= 39))
    @accuracy = 25
  elsif
    ((39 < accroll) && (accroll <= 41))
    @accuracy = 26
  elsif
    ((41 < accroll) && (accroll <= 43))
    @accuracy = 27
  elsif
    ((43 < accroll) && (accroll <= 45))
    @accuracy = 28
  elsif
    ((45 < accroll) && (accroll <= 47))
    @accuracy = 29
  elsif
    ((47 < accroll) && (accroll <= 49))
    @accuracy = 30
  elsif
    ((49 < accroll) && (accroll <= 51))
    @accuracy = 31
  elsif
    ((51 < accroll) && (accroll <= 53))
    @accuracy = 32
  elsif
    ((53 < accroll) && (accroll <= 55))
    @accuracy = 33
  elsif
    ((55 < accroll) && (accroll <= 57))
    @accuracy = 34
  elsif
    ((57 < accroll) && (accroll <= 59))
    @accuracy = 35
  elsif
    ((59 < accroll) && (accroll <= 61))
    @accuracy = 36
  elsif
    ((61 < accroll) && (accroll <= 63))
    @accuracy = 37
  elsif
    ((63 < accroll) && (accroll <= 65))
    @accuracy = 38
  elsif
    ((65 < accroll) && (accroll <= 67))
    @accuracy = 39
  elsif
    ((67 < accroll) && (accroll <= 69))
    @accuracy = 40
  elsif
    ((69 < accroll) && (accroll <= 90))
    @accuracy = (rand(1..20)) + 40
  elsif
    ((90 < accroll) && (accroll <= 96))
    @accuracy = (rand(1..20)) + 60
  elsif
    ((96 < accroll) && (accroll <= 99))
    @accuracy = (rand(1..20)) + 80
  elsif
    @accroll == 100
    @accuracy = (rand(1..20)) + 100
end 

puts "Your tentative Accuracy value is #{@accuracy}"

#intelligence

introll = (rand(1..100))

puts "Your intelligence roll is #{introll}"

if @introll == 1
	 @intelligence = (rand(1..10))
	  
  elsif
    @introll == 2
    @intelligence = 11
  elsif
    @introll == 3
    @intelligence = 12
  elsif
    @introll == 4
    @intelligence = 13
  elsif
    @introll == 5
    @intelligence = 14
  elsif
    ((5 < introll) && (introll <= 7))
    @intelligence = 15
  elsif
    ((7 < introll) && (introll <= 9))
    @intelligence = 16
  elsif
    ((9 < introll) && (introll <= 11))
    @intelligence = 17
  elsif
    ((11 < introll) && (introll <= 14))
    @intelligence = 18
  elsif
    ((14 < introll) && (introll <= 17))
    @intelligence = 19
  elsif
    ((17 < introll) && (introll <= 21))
    @intelligence = 20
  elsif
    ((21 < introll) && (introll <= 25))
    @intelligence = 21
  elsif
    ((25 < introll) && (introll <= 30))
    @intelligence = 22
  elsif
    ((30 < introll) && (introll <= 35))
    @intelligence = 23
  elsif
    ((35 < introll) && (introll <= 37))
    @intelligence = 24
  elsif
    ((37 < introll) && (introll <= 39))
    @intelligence = 25
  elsif
    ((39 < introll) && (introll <= 41))
    @intelligence = 26
  elsif
    ((41 < introll) && (introll <= 43))
    @intelligence = 27
  elsif
    ((43 < introll) && (introll <= 45))
    @intelligence = 28
  elsif
    ((45 < introll) && (introll <= 47))
    @intelligence = 29
  elsif
    ((47 < introll) && (introll <= 49))
    @intelligence = 30
  elsif
    ((49 < introll) && (introll <= 51))
    @intelligence = 31
  elsif
    ((51 < introll) && (introll <= 53))
    @intelligence = 32
  elsif
    ((53 < introll) && (introll <= 55))
    @intelligence = 33
  elsif
    ((55 < introll) && (introll <= 57))
    @intelligence = 34
  elsif
    ((57 < introll) && (introll <= 59))
    @intelligence = 35
  elsif
    ((59 < introll) && (introll <= 61))
    @intelligence = 36
  elsif
    ((61 < introll) && (introll <= 63))
    @intelligence = 37
  elsif
    ((63 < introll) && (introll <= 65))
    @intelligence = 38
  elsif
    ((65 < introll) && (introll <= 67))
    @intelligence = 39
  elsif
    ((67 < introll) && (introll <= 69))
    @intelligence = 40
  elsif
    ((69 < introll) && (introll <= 90))
    @intelligence = (rand(1..20)) + 40
  elsif
    ((90 < introll) && (introll <= 96))
    @intelligence = (rand(1..20)) + 60
  elsif
    ((96 < introll) && (introll <= 99))
    @intelligence = (rand(1..20)) + 80
  elsif
    @introll == 100
    @intelligence = (rand(1..20)) + 100
end 

puts "Your tentative Intelligence value is #{@intelligence}"

# willpower

wilroll = (rand(1..100))

puts "Your willpower roll is #{wilroll}"

if @wilroll == 1
	 @willpower = (rand(1..10))
	  
  elsif
    @wilroll == 2
    @willpower = 11
  elsif
    @wilroll == 3
    @willpower = 12
  elsif
    @wilroll == 4
    @willpower = 13
  elsif
    @wilroll == 5
    @willpower = 14
  elsif
    ((5 < wilroll) && (wilroll <= 7))
    @willpower = 15
  elsif
    ((7 < wilroll) && (wilroll <= 9))
    @willpower = 16
  elsif
    ((9 < wilroll) && (wilroll <= 11))
    @willpower = 17
  elsif
    ((11 < wilroll) && (wilroll <= 14))
    @willpower = 18
  elsif
    ((14 < wilroll) && (wilroll <= 17))
    @willpower = 19
  elsif
    ((17 < wilroll) && (wilroll <= 21))
    @willpower = 20
  elsif
    ((21 < wilroll) && (wilroll <= 25))
    @willpower = 21
  elsif
    ((25 < wilroll) && (wilroll <= 30))
    @willpower = 22
  elsif
    ((30 < wilroll) && (wilroll <= 35))
    @willpower = 23
  elsif
    ((35 < wilroll) && (wilroll <= 37))
    @willpower = 24
  elsif
    ((37 < wilroll) && (wilroll <= 39))
    @willpower = 25
  elsif
    ((39 < wilroll) && (wilroll <= 41))
    @willpower = 26
  elsif
    ((41 < wilroll) && (wilroll <= 43))
    @willpower = 27
  elsif
    ((43 < wilroll) && (wilroll <= 45))
    @willpower = 28
  elsif
    ((45 < wilroll) && (wilroll <= 47))
    @willpower = 29
  elsif
    ((47 < wilroll) && (wilroll <= 49))
    @willpower = 30
  elsif
    ((49 < wilroll) && (wilroll <= 51))
    @willpower = 31
  elsif
    ((51 < wilroll) && (wilroll <= 53))
    @willpower = 32
  elsif
    ((53 < wilroll) && (wilroll <= 55))
    @willpower = 33
  elsif
    ((55 < wilroll) && (wilroll <= 57))
    @willpower = 34
  elsif
    ((57 < wilroll) && (wilroll <= 59))
    @willpower = 35
  elsif
    ((59 < wilroll) && (wilroll <= 61))
    @willpower = 36
  elsif
    ((61 < wilroll) && (wilroll <= 63))
    @willpower = 37
  elsif
    ((63 < wilroll) && (wilroll <= 65))
    @willpower = 38
  elsif
    ((65 < wilroll) && (wilroll <= 67))
    @willpower = 39
  elsif
    ((67 < wilroll) && (wilroll <= 69))
    @willpower = 40
  elsif
    ((69 < wilroll) && (wilroll <= 90))
    @willpower = (rand(1..20)) + 40
  elsif
    ((90 < wilroll) && (wilroll <= 96))
    @willpower = (rand(1..20)) + 60
  elsif
    ((96 < wilroll) && (wilroll <= 99))
    @willpower = (rand(1..20)) + 80
  elsif
    @wilroll == 100
    @willpower = (rand(1..20)) + 100
end 

puts "Your tentative Willpower value is #{@willpower}"

# perception

perroll = (rand(1..100))

puts "Your perception roll is #{perroll}"

if @perroll == 1
	 @perception = (rand(1..10))
	  
  elsif
    @perroll == 2
    @perception = 11
  elsif
    @perroll == 3
    @perception = 12
  elsif
    @perroll == 4
    @perception = 13
  elsif
    @perroll == 5
    @perception = 14
  elsif
    ((5 < perroll) && (perroll <= 7))
    @perception = 15
  elsif
    ((7 < perroll) && (perroll <= 9))
    @perception = 16
  elsif
    ((9 < perroll) && (perroll <= 11))
    @perception = 17
  elsif
    ((11 < perroll) && (perroll <= 14))
    @perception = 18
  elsif
    ((14 < perroll) && (perroll <= 17))
    @perception = 19
  elsif
    ((17 < perroll) && (perroll <= 21))
    @perception = 20
  elsif
    ((21 < perroll) && (perroll <= 25))
    @perception = 21
  elsif
    ((25 < perroll) && (perroll <= 30))
    @perception = 22
  elsif
    ((30 < perroll) && (perroll <= 35))
    @perception = 23
  elsif
    ((35 < perroll) && (perroll <= 37))
    @perception = 24
  elsif
    ((37 < perroll) && (perroll <= 39))
    @perception = 25
  elsif
    ((39 < perroll) && (perroll <= 41))
    @perception = 26
  elsif
    ((41 < perroll) && (perroll <= 43))
    @perception = 27
  elsif
    ((43 < perroll) && (perroll <= 45))
    @perception = 28
  elsif
    ((45 < perroll) && (perroll <= 47))
    @perception = 29
  elsif
    ((47 < perroll) && (perroll <= 49))
    @perception = 30
  elsif
    ((49 < perroll) && (perroll <= 51))
    @perception = 31
  elsif
    ((51 < perroll) && (perroll <= 53))
    @perception = 32
  elsif
    ((53 < perroll) && (perroll <= 55))
    @perception = 33
  elsif
    ((55 < perroll) && (perroll <= 57))
    @perception = 34
  elsif
    ((57 < perroll) && (perroll <= 59))
    @perception = 35
  elsif
    ((59 < perroll) && (perroll <= 61))
    @perception = 36
  elsif
    ((61 < perroll) && (perroll <= 63))
    @perception = 37
  elsif
    ((63 < perroll) && (perroll <= 65))
    @perception = 38
  elsif
    ((65 < perroll) && (perroll <= 67))
    @perception = 39
  elsif
    ((67 < perroll) && (perroll <= 69))
    @perception = 40
  elsif
    ((69 < perroll) && (perroll <= 90))
    @perception = (rand(1..20)) + 40
  elsif
    ((90 < perroll) && (perroll <= 96))
    @perception = (rand(1..20)) + 60
  elsif
    ((96 < perroll) && (perroll <= 99))
    @perception = (rand(1..20)) + 80
  elsif
    @perroll == 100
    @perception = (rand(1..20)) + 100
end 

puts "Your tentative Perception value is #{@perception}"


# appearance

approll = (rand(1..100))

puts "Your perception roll is #{approll}"

if @approll == 1
	 @appearance = (rand(1..10))
	  
  elsif
    @approll == 2
    @appearance = 11
  elsif
    @approll == 3
    @appearance = 12
  elsif
    @approll == 4
    @appearance = 13
  elsif
    @approll == 5
    @appearance = 14
  elsif
    ((5 < approll) && (approll <= 7))
    @appearance = 15
  elsif
    ((7 < approll) && (approll <= 9))
    @appearance = 16
  elsif
    ((9 < approll) && (approll <= 11))
    @appearance = 17
  elsif
    ((11 < approll) && (approll <= 14))
    @appearance = 18
  elsif
    ((14 < approll) && (approll <= 17))
    @appearance = 19
  elsif
    ((17 < approll) && (approll <= 21))
    @appearance = 20
  elsif
    ((21 < approll) && (approll <= 25))
    @appearance = 21
  elsif
    ((25 < approll) && (approll <= 30))
    @appearance = 22
  elsif
    ((30 < approll) && (approll <= 35))
    @appearance = 23
  elsif
    ((35 < approll) && (approll <= 37))
    @appearance = 24
  elsif
    ((37 < approll) && (approll <= 39))
    @appearance = 25
  elsif
    ((39 < approll) && (approll <= 41))
    @appearance = 26
  elsif
    ((41 < approll) && (approll <= 43))
    @appearance = 27
  elsif
    ((43 < approll) && (approll <= 45))
    @appearance = 28
  elsif
    ((45 < approll) && (approll <= 47))
    @appearance = 29
  elsif
    ((47 < approll) && (approll <= 49))
    @appearance = 30
  elsif
    ((49 < approll) && (approll <= 51))
    @appearance = 31
  elsif
    ((51 < approll) && (approll <= 53))
    @appearance = 32
  elsif
    ((54 < approll) && (approll <= 55))
    @appearance = 33
  elsif
    ((55 < approll) && (approll <= 57))
    @appearance = 34
  elsif
    ((57 < approll) && (approll <= 59))
    @appearance = 35
  elsif
    ((59 < approll) && (approll <= 61))
    @appearance = 36
  elsif
    ((61 < approll) && (approll <= 63))
    @appearance = 37
  elsif
    ((63 < approll) && (approll <= 65))
    @appearance = 38
  elsif
    ((65 < approll) && (approll <= 67))
    @appearance = 39
  elsif
    ((67 < approll) && (approll <= 69))
    @appearance = 40
  elsif
    ((69 < approll) && (approll <= 90))
    @appearance = (rand(1..20)) + 40
  elsif
    ((90 < approll) && (approll <= 96))
    @appearance = (rand(1..20)) + 60
  elsif
    ((97 < approll) && (approll <= 99))
    @appearance = (rand(1..20)) + 80
  elsif
    @approll == 100
    @appearance = (rand(1..20)) + 100
end 

puts "Your tentative Appearance value is #{@appearance}"

# HOLY SHIT WE ARE ROCKING NOW!!!

# Now, to caste. Planning a different approach:
#instead of a whole table for each race, 
# we'll create conditionals: one roll per character,
# with if/else conditionals

puts "Woo hoo, we're rocking now!"

puts "Now let's find out what you used to be..."

# https://www.blackbytes.info/2016/05/weighted-random-numbers/

# weighting caste list based on race and randomly selecting from it...

# **********
#
# Q: do I need to change all race to @race below? To get this to work?
#
# **********

def random_weighted(weighted)
  max    = sum_of_weights(weighted)
  target = rand(1..max)
 
  weighted.each do |item, weight|
    return item if target <= weight
    target -= weight
  end
end
 
def sum_of_weights(weighted)
  weighted.inject(0) { |sum, (item, weight)| sum + weight }
end

#********************
# TABLE TME-1-4 Character's Pre-Game
# Caste Determination
#
# Hub rules book v2, p. 11
# 
# Originally, roll d100
# I've implemented weighted lists instead
#********************
# caste selection for pure stock humans

if @race == "Pure Stock Human"
  
purestockhuman_caste = Hash.new(0)
 
def psh_pick_number
  random_weighted("Slave, Labor": 1, 
  "Slave, Kitchen": 1, 
  "Slave, Servant": 1, 
  "Slave, Whore": 1, 
  "Slave, Court": 1, 
  "Slave, Gladiator": 1, 
  "Fisher": 2, 
  "Hunter": 2, 
  "Miner": 2, 
  "Logger": 2, 
  "Farmer": 2, 
  "Nomad": 2, 
  "Trader": 4, 
  "Craftsperson": 2, 
  "Student": 12, 
  "Scribe": 3, 
  "Technician": 35, 
  "Street Urchin": 1, 
  "Street Thug": 1, 
  "Raider": 1, 
  "Pirate": 1, 
  "Thief": 2, 
  "Assassin": 5, 
  "Draftee": 1, 
  "Militia Soldier": 1, 
  "Watchman": 1, 
  "Infantryman": 2, 
  "Cavalry": 2, 
  "Mercenary": 2, 
  "Elite Soldier": 6)
end


1.times { purestockhuman_caste[psh_pick_number] += 1 }
caste = purestockhuman_caste

puts "Your caste is #{caste}"

# caste selection for comfort clones


elsif @race == "Clone, Comfort"

  
clonecomfort_caste = Hash.new(0)
 
def cco_pick_number
  random_weighted("Slave, Labor": 1, 
  "Slave, Kitchen": 8, 
  "Slave, Servant": 15, 
  "Slave, Whore": 68, 
  "Slave, Court": 5, 
  "Craftsperson": 1, 
  "Student": 1, 
  "Scribe": 1)
end

1.times { clonecomfort_caste[cco_pick_number] += 1 }
caste = clonecomfort_caste

puts "Your caste is #{clonecomfort_caste}"

# caste selection for labor clones


elsif @race == "Clone, Labor"

  
clonelabor_caste = Hash.new(0)
 
def cla_pick_number
  random_weighted("Slave, Labor": 43, 
  "Slave, Kitchen": 3, 
  "Slave, Servant": 1, 
  "Slave, Gladiator": 9,
  "Fisher": 1, 
  "Hunter": 1, 
  "Miner": 8,
  "Logger": 8,
  "Farmer": 8,
  "Nomad": 1,
  "Craftsperson": 2,
  "Street Thug": 2,
  "Raider": 1,
  "Pirate": 1,
  "Draftee": 4,
  "Militia Soldier": 1,
  "Watchman": 1,
  "Infantryman": 1,
  "Cavalry": 1,
  "Mercenary": 2,
  "Elite Soldier": 1)
end

1.times { clonelabor_caste[cla_pick_number] += 1 }
caste = clonelabor_caste

puts "Your caste is #{clonelabor_caste}"

# caste selection for military clones

elsif @race == "Clone, Military"
  
clonemil_caste = Hash.new(0)
 
def cmi_pick_number
  random_weighted("Slave, Labor": 1, 
  "Slave, Gladiator": 27, 
  "Hunter": 1, 
  "Nomad": 2, 
  "Street Thug": 5, 
  "Raider": 2, 
  "Pirate": 2, 
  "Assassin": 5, 
  "Draftee": 1, 
  "Militia Soldier": 2, 
  "Watchman": 6, 
  "Infantryman": 3, 
  "Cavalry": 8, 
  "Mercenary": 23, 
  "Elite Soldier": 2)
end

1.times { clonemil_caste[cmi_pick_number] += 1 }
caste = clonemil_caste

puts "Your caste is #{clonemil_caste}"

# caste for bioreplica, pleasure

elsif @race == "bioreplica, Pleasure"
  
bpl_caste = Hash.new(0)
 
def bpl_pick_number
  random_weighted("Slave, Labor": 1, 
  "Slave, Kitchen": 5, 
  "Slave, Servant": 6, 
  "Slave, Whore": 73, 
  "Slave, Court": 6, 
  "Nomad": 2, 
  "Craftsperson": 1, 
  "Scribe": 1, 
  "Street Urchin": 3, 
  "Thief": 2)
end

1.times { bpl_caste[bpl_pick_number] += 1 }
caste = bpl_caste

puts "Your caste is #{bpl_caste}"

# caste selection for industrial bioreplicants

elsif @race == "Bioreplica, Industrial"
  
bin_caste = Hash.new(0)
 
def bin_pick_number
  random_weighted("Slave, Labor": 23, 
  "Slave, Kitchen": 1, 
  "Slave, Gladiator": 8, 
  "Fisher": 1, 
  "Hunter": 1, 
  "Miner": 8, 
  "Logger": 2, 
  "Farmer": 3, 
  "Nomad": 5, 
  "Craftsperson": 1, 
  "Technician": 2, 
  "Street Thug": 7, 
  "Raider": 5, 
  "Pirate": 1, 
  "Assassin": 1, 
  "Draftee": 6, 
  "Militia Soldier": 1, 
  "Watchman": 2, 
  "Infantryman": 9, 
  "Cavalry": 2, 
  "Mercenary": 6, 
  "Elite Soldier": 4)
end

1.times { bin_caste[bin_pick_number] += 1 }
caste = bin_caste

puts "Your caste is #{bin_caste}"

# caste selection for clerical bioreplicants

elsif @race == "Bioreplicant, Clerical"
  
bcl_caste = Hash.new(0)
 
def bcl_pick_number
  random_weighted("Slave, Labor": 1, 
  "Slave, Kitchen": 1, 
  "Slave, Servant": 17, 
  "Slave, Whore": 3, 
  "Slave, Court": 34, 
  "Nomad": 7, 
  "Trader": 8, 
  "Craftsperson": 2, 
  "Student": 2, 
  "Scribe": 7, 
  "Technician": 10, 
  "Thief": 1, 
  "Assassin": 1, 
  "Draftee": 1, 
  "Militia Soldier": 1, 
  "Infantryman": 1, 
  "Cavalry": 1, 
  "Mercenary": 1, 
  "Elite Soldier": 1)
end

1.times { bcl_caste[bcl_pick_number] += 1 }
caste = bcl_caste

puts "Your caste is #{bcl_caste}"

# caste selection for infiltration bioreplicants

elsif @race == "Bioreplicant, Infiltration"
  
binf_caste = Hash.new(0)
 
def binf_pick_number
  random_weighted("Slave, Labor": 1, 
  "Slave, Servant": 1, 
  "Slave, Whore": 1, 
  "Slave, Court": 2, 
  "Slave, Gladiator": 4, 
  "Fisher": 1, 
  "Hunter": 1, 
  "Miner": 1, 
  "Logger": 1, 
  "Farmer": 1, 
  "Nomad": 8, 
  "Trader": 3, 
  "Craftsperson": 2, 
  "Student": 1, 
  "Scribe": 4, 
  "Technician": 5, 
  "Street Thug": 1, 
  "Raider": 4, 
  "Pirate": 3, 
  "Thief": 1, 
  "Assassin": 37, 
  "Draftee": 1, 
  "Militia Soldier": 1, 
  "Watchman": 1, 
  "Infantryman": 1, 
  "Cavalry": 1, 
  "Mercenary": 7, 
  "Elite Soldier": 5)
end

1.times { binf_caste[binf_pick_number] += 1 }
caste = binf_caste

puts "Your caste is #{binf_caste}"

# caste selection for battle bioreplicants

elsif @race == "Bioreplicant, Battle"
  
bba_caste = Hash.new(0)
 
def bba_pick_number
  random_weighted("Slave, Labor": 1, 
  "Slave, Gladiator": 31, 
  "Fisher": 1, 
  "Hunter": 1, 
  "Miner": 1, 
  "Logger": 1, 
  "Farmer": 1, 
  "Nomad": 5, 
  "Trader": 1, 
  "Street Thug": 2, 
  "Raider": 4, 
  "Pirate": 2, 
  "Assassin": 11, 
  "Draftee": 1, 
  "Militia Soldier": 1, 
  "Watchman": 2, 
  "Infantryman": 4, 
  "Cavalry": 3, 
  "Mercenary": 13, 
  "Elite Soldier": 14)
end

1.times { bba_caste[bba_pick_number] += 1 }
caste = bba_caste

puts "Your caste is #{bba_caste}"

# caste selection for trans-humans

elsif @race == "Trans-Human"
  
thu_caste = Hash.new(0)
 
def thu_pick_number
  random_weighted("Slave, Labor": 1, 
  "Slave, Kitchen": 1, 
  "Slave, Servant": 1, 
  "Slave, Whore": 1, 
  "Slave, Court": 2, 
  "Slave, Gladiator": 3, 
  "Fisher": 1, 
  "Hunter": 1, 
  "Miner": 1, 
  "Logger": 1, 
  "Farmer": 1, 
  "Nomad": 2, 
  "Trader": 1, 
  "Craftsperson": 1, 
  "Student": 1, 
  "Scribe": 1, 
  "Technician": 43, 
  "Street Thug": 1, 
  "Raider": 1, 
  "Pirate": 1, 
  "Assassin": 6, 
  "Infantryman": 2, 
  "Cavalry": 2, 
  "Mercenary": 12, 
  "Elite Soldier": 12)
end

1.times { thu_caste[thu_pick_number] += 1 }
caste = thu_caste

puts "Your caste is #{thu_caste}"

# caste selection for cyborgs

elsif @race == "Cyborg"
  
cyb_caste = Hash.new(0)
 
def cyb_pick_number
  random_weighted("Slave, Gladiator": 8, "Hunter": 2, 
  "Nomad": 10, 
  "Trader": 4, 
  "Technician": 1, 
  "Street Thug": 2, 
  "Raider": 6, 
  "Pirate": 5, 
  "Thief": 1, 
  "Assassin": 5, 
  "Draftee": 5, 
  "Militia Soldier": 7, 
  "Watchman": 4, 
  "Infantryman": 11, 
  "Cavalry": 1, 
  "Mercenary": 29, 
  "Elite Soldier": 4)
end

1.times { cyb_caste[cybpick_number] += 1 }
caste = cyb_caste

puts "Your caste is #{cyb_caste}"

# caste selection for ghost mutants

elsif @race == "Ghost Mutant"
  
gmu_caste = Hash.new(0)
 
def gmu_pick_number
  random_weighted("Slave, Labor": 5, 
  "Slave, Kitchen": 2, 
  "Slave, Servant": 2, 
  "Slave, Whore": 3, 
  "Slave, Court": 2, 
  "Slave, Gladiator": 2, 
  "Fisher": 4, 
  "Hunter": 6, 
  "Miner": 3, 
  "Logger": 4, 
  "Farmer": 19, 
  "Nomad": 9, 
  "Trader": 1, 
  "Craftsperson": 1, 
  "Student": 1, 
  "Scribe": 1, 
  "Technician": 1, 
  "Street Urchin": 1, 
  "Street Thug": 1, 
  "Raider": 1, 
  "Pirate": 1, 
  "Thief": 4, 
  "Assassin": 1, 
  "Draftee": 2, 
  "Militia Soldier": 3, 
  "Watchman": 3, 
  "Infantryman": 4, 
  "Cavalry": 5, 
  "Mercenary": 7, 
  "Elite Soldier": 2)
end

1.times { gmu_caste[gmu_pick_number] += 1 }
caste = gmu_caste

puts "Your caste is #{gmu_caste}"

# caste selection for non-ghost mutants
# *** excluding "freakish horror" *** for now because not sure whether I'll ever complete this project!

elsif race = "Mutant, Mild" || race = "Mutant, Typical" || race = "Mutant, Severe" 
  
mut_caste = Hash.new(0)
 
def mut_pick_number
  random_weighted("Slave, Labor": 8, 
  "Slave, Kitchen": 2, 
  "Slave, Servant": 2, 
  "Slave, Whore": 2, 
  "Slave, Court": 1, 
  "Slave, Gladiator": 9, 
  "Fisher": 3, 
  "Hunter": 3, 
  "Miner": 3, 
  "Logger": 3, 
  "Farmer": 13, 
  "Nomad": 6, 
  "Trader": 1, 
  "Craftsperson": 1, 
  "Student": 1, 
  "Scribe": 1, 
  "Technician": 1, 
  "Street Urchin": 4, 
  "Street Thug": 4, 
  "Raider": 5, 
  "Pirate": 2, 
  "Thief": 2, 
  "Assassin": 1, 
  "Draftee": 3, 
  "Militia Soldier": 4, 
  "Watchman": 2, 
  "Infantryman": 5, 
  "Cavalry": 3, 
  "Mercenary": 5, 
  "Elite Soldier": 1)
end

1.times { mut_caste[mut_pick_number] += 1 }
caste = mut_caste

puts "Your caste is #{mut_caste}"

# caste selection for bestial humans

elsif @race == "Bestial Human" 
  
bes_caste = Hash.new(0)
 
def bes_pick_number
  random_weighted("Slave, Labor": 15, 
  "Slave, Servant": 2, 
  "Slave, Gladiator": 9, 
  "Fisher": 1, 
  "Hunter": 6, 
  "Miner": 1, 
  "Logger": 3, 
  "Farmer": 1, 
  "Nomad": 6, 
  "Trader": 1, 
  "Craftsperson": 1, 
  "Street Urchin": 2, 
  "Street Thug": 1, 
  "Raider": 7, 
  "Pirate": 2, 
  "Thief": 2, 
  "Assassin": 2, 
  "Draftee": 7, 
  "Militia Soldier": 6, 
  "Watchman": 5, 
  "Infantryman": 3, 
  "Cavalry": 1, 
  "Mercenary": 16, 
  "Elite Soldier": 1)
end

1.times { bes_caste[bes_pick_number] += 1 }
caste = bes_caste

puts "Your caste is #{bes_caste}"



# ********************
# END of caste selection segment
# ********************
#
# BEGIN Caste Based Details
#
# Table TME1-5a, Caste Based Details
#
# Hub Rules v2 p. 12
# ********************
# using special subtraction from
# here: https://stackoverflow.com/questions/43619161/subtraction-in-ruby-no-less-than-1/43619204
#
puts "Okay, now let's calculate how your caste affects your attributes..."

if @caste.include? "Slave, Laborer"
  
  @endurance = (@endurance + (rand(1..10)))
  @strength = (@strength + (rand(1..10)))
  @intelligence = (@intelligence - (rand(1..10)))
  @perception = (@perception - (rand(1..6)))
  @outfittingcode = "Escaped Prisoner"
  
elsif @caste.include? "Slave, Kitchen"

  @endurance = (@endurance - (rand(1..6)))
  @strength = (@strength - (rand(1..6)))
  @intelligence = (@intelligence + (rand(1..6)))
  @willpower = (@willpower - (rand(1..12)))
  @outfittingcode = "Escaped Prisoner"
  
elsif @caste.include? "Slave, Servant"

  @endurance = (@endurance - (rand(1..6)))
  @strength = (@strength - (rand(1..6)))
  @intelligence = (@intelligence + (rand(1..6)))
  @perception = (@perception + (rand(1..6)))
  @willpower = (@willpower - (rand(1..6)))
  @outfittingcode = "Escaped Prisoner"
  #skills: 1 roll on misc Table
  
elsif @caste.include? "Slave, Whore"

  @endurance = (@endurance - (rand(1..6)))
  @strength = (@strength - (rand(1..6)))
  @intelligence = (@intelligence - (rand(1..6)))
  @willpower = (@willpower - (rand(1..6)))
  @appearance = (@appearance + (rand(1..6)))
  @outfittingcode = "Escaped Prisoner"
  #skills: +1 erotic arts; nil
  
elsif @caste.include? "Slave, Court"

  @endurance = (@endurance - (rand(1..6)))
  @strength = (@strength - (rand(1..6)))
  @intelligence = (@intelligence - (rand(1..6)))
  @perception = (@perception + (rand(1..6)))
  @willpower = (@willpower - (rand(1..6)))
  @appearance = (@appearance + (rand(1..6)))
  @outfittingcode = "Escaped Prisoner"
  #skills: +3 rolls on misc table
  
elsif @caste.include? "Slave, Gladiator"

  @endurance = (@endurance + (rand(1..10) + (rand(1.10))))
  @strength = (@strength + (rand(1..10) + (rand(1.10))))
  @agility = (@agility + (rand(1..8)))
  @accuracy = (@accuracy + (rand(1..8)))
  @intelligence = (@intelligence - (rand(1..10)))
  @perception = (@perception + (rand(1..8)))
  @willpower = (@willpower - (rand(1..4)))
  @appearance = (@appearance - (rand(1..8) + (rand(1..8))))
  @outfittingcode = "Escaped Prisoner"
  #skills: brawling rand(1..3); warrior rand(1..4)+4 rolls
  
elsif @caste.include? "Fisher"

  @endurance = (@endurance + (rand(1..6)))
  @strength = (@strength + (rand(1..6)))
  @perception = (@perception + (rand(1..8)))
  @outfittingcode = "Poor"
  #skills: spear weapons rand(1..3); 1 misc roll
  
elsif @caste.include? "Hunter"

  @endurance = (@endurance + (rand(1..8)))
  @strength = (@strength + (rand(1..8)))
  @agility = (@agility + (rand(1..6)))
  @accuracy = (@accuracy + (rand(1..6)))
  @perception = (@perception + (rand(1..8)))
  @outfittingcode = "Poor"
  #skills: bow weapons expert rand(1..3); wilderness survival 1; 1 roll on misc table
  
elsif @caste.include? "Miner"

  @endurance = (@endurance + (rand(1..10)))
  @strength = (@strength + (rand(1..10) + (rand(1..10))))
  @appearance = (@appearance - (rand(1..6)))
  @outfittingcode = "Poor"
  #skills: pickaxe weapons expert rand(1..3); 1 roll on misc table
  
elsif @caste.include? "Logger"

  @endurance = (@endurance + (rand(1..8)))
  @strength = (@strength + (rand(1..8)))
  @agility = (@agility + (rand(1..6)))
  @perception = (@perception + (rand(1..6)))
  @appearance = (@appearance - (rand(1..3)))
  @outfittingcode = "Poor"
  #skills: axe weapons expert rand(1..3); 1 roll on misc table
  
elsif @caste.include? "Farmer"

  @endurance = (@endurance + (rand(1..6)))
  @strength = (@strength + (rand(1..6)))
  @perception = (@perception + (rand(1..6)))
  @outfittingcode = "Poor"
  #skills: pitchfork weapons expert rand(1..3); 1 roll on misc table
  
elsif @caste.include? "Nomad"

  @agility = (@agility + (rand(1..10)))
  @perception = (@perception + (rand(1..6)))
  @outfittingcode = "Poor"
  #skills: rider rand(1..3); Navigate by stars 1; rand(1..3) rolls on misc table
  
elsif @caste.include? "Trader"

  @intelligence = (@intelligence + (rand(1..10) + (rand(1..10))))
  @perception = (@perception + (rand(1..10)))
  @outfittingcode = "Well Equipped"
  #skills: barter 1; rand(1..3)+1 rolls on misc table
  
elsif @caste.include? "Student"

  @endurance = (@endurance - (rand(1..6)))
  @strength = (@strength - (rand(1..6)))
  @intelligence = (@intelligence + (rand(1..10) + (rand(1..10) + (rand(1..10)))))
  @appearance = (@appearance + (rand(1..6)))
  @outfittingcode = "Modest"
  #skills: educated - rand(1..6) + rand(1..6) + 2 rolls on educated table; rand(1..2) rolls on misc table
  
elsif @caste.include? "Scribe"

  @endurance = (@endurance - (rand(1..6)))
  @strength = (@strength - (rand(1..6)))
  @perception = (@perception + (rand(1..6)))
  @outfittingcode = "Modest"
  #skills: educated rand(1..3) rolls; 1 misc roll
  
elsif @caste.include? "Technician"

  @agility = (@agility + (rand(1..3)))
  @accuracy = (@accuracy + (rand(1..3)))
  @intelligence = (@intelligence + (rand(1..8) + (rand(1..8))))
  @outfittingcode = "Well Equipped"
  #skills: tech skills 2d6; educated d2; misc d3
  
elsif @caste.include? "Street Urchin"

  @endurance = (@endurance - (rand(1..6)))
  @strength = (@strength - (rand(1..3)))
  @agility = (@agility + (rand(1..10)))
  @accuracy = (@accuracy + (rand(1..6)))
  @appearance = (@appearance - (rand(1..6)))
  @outfittingcode = "Impoverished"
  #skills: brawling d3; criminal d3+1; 1 misc roll
  
elsif @caste.include? "Street Thug"

  @endurance = (@endurance + (rand(1..6) + (rand(1..6))))
  @strength = (@strength + (rand(1..6) + (rand(1..6))))
  @intelligence = (@intelligence - (rand(1..6)))
  @appearance = (@appearance - (rand(1..6)))
  @outfittingcode = "Poor"
  #skills: brawling d4; criminal 2; warrior 2; 1 roll on misc table
  
elsif @caste.include? "Raider"

  @endurance = (@endurance + (rand(1..10)))
  @strength = (@strength + (rand(1..10)))
  @outfittingcode = "Poor"
  #skills: rider d3; criminal 2; warrior 2; 1 roll on misc table

elsif @caste.include? "Pirate"

  @endurance = (@endurance + (rand(1..10)))
  @strength = (@strength + (rand(1..10)))
  @outfittingcode = "Poor"
  #skills: navigate by stars 1; criminal 2; warrior 2; 1 roll on misc table
  
elsif @caste.include? "Thief"

  @endurance = (@endurance - (rand(1..3)))
  @strength = (@strength - (rand(1..3)))
  @agility = (@agility + (rand(1..12)))
  @accuracy = (@accuracy + (rand(1..8)))
  @outfittingcode = "Impoverished"
  #skills: brawling 1; criminal d3+4; 1 roll on misc table
  
elsif @caste.include? "Assassin"

  @endurance = (@endurance + (rand(1..6)))
  @strength = (@strength + (rand(1..6) + (rand(1..6))))
  @agility = (@agility + (rand(1..10)))
  @accuracy = (@accuracy + (rand(1..10)))
  @perception = (@perception + (rand(1..10)))
  @outfittingcode = "Fully Armed"
  #skills: martial arts d4; knife throwing d3; criminal d3; warrior d6; 1 roll on misc table
  
elsif @caste.include? "Draftee"

  @endurance = (@endurance + (rand(1..3)))
  @strength = (@strength + (rand(1..3)))
  @outfittingcode = "Modest"
  #skills: warrior 1; misc d2
  
elsif @caste.include? "Militia"

  @endurance = (@endurance + (rand(1..6)))
  @strength = (@strength + (rand(1..6)))
  @outfittingcode = mo
  #skills: warrior d3; misc d2
  
elsif @caste.include? "Watchman"

  @endurance = (@endurance + (rand(1..6)))
  @strength = (@strength + (rand(1..10)))
  @perception = (@perception + (rand(1..10)))
  @outfittingcode = "Well Equipped"
  #skills: brawling d3; warrior d3; misc d2

  
elsif @caste.include? "Infantryman"

  @endurance = (@endurance + (rand(1..12)))
  @strength = (@strength + (rand(1..12)))
  @outfittingcode = "Well Equipped"
  #skills: warrior d6; misc d2
  
elsif @caste.include? "Cavalry"

  @endurance = (@endurance + (rand(1..10)))
  @strength = (@strength + (rand(1..12)))
  @agility = (@agility + (rand(1..3)))
  @outfittingcode = "Well Equipped"
  #skills: riding d6; warrior d4; misc d2

elsif @caste.include? "Mercenary"

  @endurance = (@endurance + (rand(1..10)))
  @strength = (@strength + (rand(1..10)))
  @agility = (@agility + (rand(1..6)))
  @accuracy = (@accuracy + (rand(1..6)))
  @outfittingcode = "Well Equipped"
  #skills: brawling d3; warrior d6; misc d4
  
elsif @caste.include? "Elite Soldier"

  @endurance = (@endurance + (rand(1..8) + (rand(1..8))))
  @strength = (@strength + (rand(1..8) + (rand(1..8))))
  @agility = (@agility + (rand(1..8)))
  @accuracy = (@accuracy + (rand(1..8)))
  @willpower = (@willpower + (rand(1..8)))
  @outfittingcode = "Well Equipped"
  #skills: brawling d4; warrior d6+4; misc d4
  


puts "Okay, here are your adjusted attributes:"
puts "Endurance: #{@endurance}"
puts "Strength #{@strength}"
puts "Agility #{@agility}"
puts "Accuracy #{@accuracy}"
puts "Intelligence #{@intelligence}"
puts "Perception #{@perception}"
puts "Willpower #{@willpower}"
puts "Appearance #{@appearance}"
puts @caste.to_s
end
# thought: maybe I should write up a 
# few lines that output something like:
# "You're average strength
# and very bright, but"
# your (lowest-attribute) is your real weakness.
# Idea being to provide some context for the attribute rolls...

# ********************
#
# End of caste-based details table
#
# ********************

end
