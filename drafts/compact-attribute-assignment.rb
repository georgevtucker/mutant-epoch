attributes = []

attribute_rolls = []
    

8.times do attribute_rolls << rand(1..100)
end 

puts attribute_rolls

attribute_rolls.each do |value| 
  attributes << 
  case 

    when value == 1 then rand(1..10)
    when value == 2 then  11
    when value == 3 then  12
    when value == 4 then  13
    when value == 5 then  14
    when value.between?(5, 7) then  15
    when value.between?(8, 9) then  16
    when value.between?(10, 11) then  17
    when value.between?(12, 14) then  18
    when value.between?(15, 17) then  19
    when value.between?(18, 21) then  20
    when value.between?(22, 25) then  21
    when value.between?(26, 30) then  22
    when value.between?(31, 35) then  23
    when value.between?(36, 37) then  24
    when value.between?(38, 39) then  25
    when value.between?(40, 41) then  26
    when value.between?(42, 43) then  27
    when value.between?(44, 45) then  28
    when value.between?(46, 47) then  29
    when value.between?(48, 49) then  30
    when value.between?(50, 51) then  31
    when value.between?(52, 53) then  32
    when value.between?(54, 55) then  33
    when value.between?(56, 57) then  34
    when value.between?(58, 59) then  35
    when value.between?(60, 61) then  36
    when value.between?(62, 63) then  37
    when value.between?(64, 65) then  38
    when value.between?(66, 67) then  39
    when value.between?(68, 69) then  40
    when value.between?(70, 90) then  (40 + rand(1..20))
    when value.between?(91, 96) then  (60 + rand(1..20))
    when value.between?(97, 99) then  (80 + rand(1..20))
    when value == 100 then  (100 + rand(1..20))
    else puts "Whoops!"
    end


end


puts "Your attribute rolls are:"
puts "Endurance: #{attribute_rolls[0]}"
puts "Strength: #{attribute_rolls[1]}"
puts "Agility: #{attribute_rolls[2]}"
puts "Accuracy: #{attribute_rolls[3]}"
puts "Intelligence: #{attribute_rolls[4]}"
puts "Willpower: #{attribute_rolls[5]}"
puts "Perception: #{attribute_rolls[6]}"
puts "Appearance: #{attribute_rolls[7]}"
puts "You can forget about these now -- their work here is done."

#puts "Your attribute rolls are: #{attribute_rolls}"
puts "\n"
puts "And after automagically looking up those values - your attributes are..."


puts "Endurance: #{attributes[0]}"
puts "Strength: #{attributes[1]}"
puts "Agility: #{attributes[2]}"
puts "Accuracy: #{attributes[3]}"
puts "Intelligence: #{attributes[4]}"
puts "Willpower: #{attributes[5]}"
puts "Perception: #{attributes[6]}"
puts "Appearance: #{attributes[7]}"
