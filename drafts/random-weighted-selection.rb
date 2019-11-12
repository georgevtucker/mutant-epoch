# https://www.blackbytes.info/2016/05/weighted-random-numbers/

# weighting caste list based on race and randomly selecting from it...

# WORKING BUT results aren't printing nicely -- need to strip out special characters or map ugly results to pretty results. 

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

counts = Hash.new(0)
 
def pick_number
  random_weighted("Slave": 1,
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


1.times { counts[pick_number] += 1 }


puts "#{counts}"

puts "Caste: #{counts}" 
