module Sub
  def sub(adjust)
    self.value = [self.value - adjust, 1].max
  end
end 

class Character
  attr_accessor :strength, :endurance, :agility, :accuracy, :intelligence, :willpower, :perception, :appearance, :skills, :attacks, :movement_rate_base, :movement_rate_swimming, :movement_rate_flying, :dv, :initiative, :character_weight, :character_height, :dominant_hand, :swimming_skill, :starting_age, :damage_modifier, :dv_agility_modifier, :endurance_healing_rate, :strength_range, :agility_move_bonus, :accuracy_SV_bonus, :perception_initiative_modifier, :gender, :sexual_orientation, :skin_color, :hair_color, :languages_spoken, :diseases_or_parasites, :debts, :enemies, :character_notes, :number_of_languages, :armor, :dv_armored, :equipment, :days_rations, :liters_water, :valuables_carried, :outfitting_code, :money
    
  def generic_attributes_assign(roll)
    #Table TME-1-2, Hub Rules p. 10
    case roll
    when 1
      d(10)
    when 2
      11
    when 3
      12
    when 4
      13
    when 5
      14
    when 6..7
      15
    when 8..9
      16
    when 10..11
      17
    when 12..14
      18
    when 15..17
      19
    when 18..21
      20
    when 22..25
      21
    when 26..30
      22
    when 31..35
      23
    when 36..37
      24
    when 38..39
      25
    when 40..41
      26
    when 42..43
      27
    when 44..45
      28
    when 46..47
      29
    when 48..49
      30
    when 50..51
      31
    when 52..53
      32
    when 54..55
      33
    when 56..57
      34
    when 58..59
      35
    when 60..61
      36
    when 62..63
      37
    when 64..65
      38
    when 66..67
      39
    when 68..69
      40
    when 70..90
      (40 + d(20))
    when 91..96
      60 + d(20)
    when 97..99
      (80 + d(20))
    when 100
      (100 + d(20))
    else
      puts "Whoops!"
    end
  end

  def initialize
    #@player_level = player_level
    @race = nil
    @endurance = generic_attributes_assign(d(100))
    @strength = generic_attributes_assign(d(100))
    @agility = generic_attributes_assign(d(100))
    @accuracy = generic_attributes_assign(d(100))
    @intelligence = generic_attributes_assign(d(100))
    @willpower = generic_attributes_assign(d(100))
    @perception = generic_attributes_assign(d(100))
    @appearance = generic_attributes_assign(d(100))
    @skills = []
    @equipment = []
    @attacks = []
    @character_notes = []
    # NOTE: I want there to be a tidier way to bring in all these variables... 
    @movement_rate_base = 0
    @movement_rate_swimming = 0
    @movement_rate_flying = 0
    @dv = 0
    @initiative = 0
    @character_weight = 0
    @character_height = 0
    @dominant_hand = "None"
    @swimming_skill = 0
    @starting_age = 0
    @damage_modifier = 0 # derived from strength
    @dv_agility_modifier = 0
    @endurance_healing_rate = 0
    @strength_range = 0
    @agility_move_bonus = 0
    @accuracy_SV_bonus = 0
    @perception_initiative_modifier = 0
    @gender = "None"
    @sexual_orientation = "None"
    @character_weight = 0
    @character_height = 0
    @skin_color = "None"
    @hair_color = "None"
    @eye_color = "None"
    @religion = "None"
    @languages_spoken = Array.new
    @diseases_or_parasites = Array.new
    @cancer = "No"
    @radiation_exposure = 0
    @debts = Array.new
    @friends_and_allies = Array.new
    @enemies = Array.new
    @character_notes = Array.new
    @number_of_languages = 1

    ##### Gear #####
    @armor = {:location => "Location", :dv => "DV", :move_mod => "Move Modifier", :armor_type => "Type"}
    @dv_armored = 0 # later on, after all armor in place, @@armor.each do sum DV then sum that with base DV to get dv_armored
    @equipment = Array.new
    @days_rations = 0
    @liters_water = 0
    @valuables_carried = Array.new
    @outfittingcode = "none"
    @money = 0
  end



  def add(adjust)
    self.value += adjust
  end
  # def set_race(result)
  #   @race=race_assign(d(100))
  # end
  def perception_initiative_modifier(perception)
    case perception
      when 1..4
        -2
      when 5..9
        -1
      when 10..34
        0
      when 35..64
        1
      when 65..84
        2
      when 85..105
        3
      else
        4
    end
  end

  #### Attribute-based secondary characteristics, table TME-1-3, Hub Rules p. 10 ####

  def healing_rate(endurance)
    case endurance
      when 1..4
        1
      when 5..9
        2
      when 10..34
        3
      when 35..44
        4
      when 45..54
        5
      when 55..64
        6
      when 65..74
        7
      when 75..84
        8
      when 85..94
        9
      when 95..105
        10
      when 106..300
        (11 + ((@endurance - 106) / 5))
    end
      # this might not work -- have to test
    if @race.include? "Bioreplica"
      @endurance_healing_rate += 2
    end
    # need to add exception or check for "Body Regeneration" mutation and add...
  end

  def strength_damage_mod(strength)
    case strength
      when 1..4
        -4
      when 5..9
        -2
      when 10..34
        0
      when 35..44
        2
      when 45..54
        4
      when 55..64
        6
      when 65..74
        8
      when 75..84
        10
      when 85..94
        12
      when 95..105
        14
      when 106..300
        (16 + (((@strength - 106) / 5) * 2))
    end
  end

  def strength_range_bonus(strength)
    case strength
      when 1..4
        -0.2
      when 5..9
        -0.1
      when 10..34
        0
      when 35..44
        0.1
      when 45..54
        0.2
      when 55..64
        0.3
      when 65..74
        0.4
      when 75..84
        0.5
      when 85..94
        0.6
      when 95..105
        0.7
      when 106..300
        (0.8 + ((@strength - 106) / 100))
    end
  end

  def agility_dv(agility)
    case agility
      when 1..4
        4
      when 5..9
        2
      when 10..34
        0
      when 35..44
        -2
      when 45..54
        -4
      when 55..64
        -6
      when 65..74
        -8
      when 75..84
        -10
      when 85..94
        -12
      when 95..105
        -14
      when 106..300
        (-16 - ((@agility - 106) / 5))
    end
  end


  def agility_move_bonus(agility)
    case agility
      when 1..4
        -0.5
      when 5..9
        -0.25
      when 10..34
        0
      when 35..44
        0.25
      when 45..54
        0.5
      when 55..64
        0.75
      when 65..74
        1
      when 75..84
        1.25
      when 85..94
        1.5
      when 95..105
        1.75
      when 106..300
        (2 + ((@agility - 106) / 5) * 0.25)
    end
  end

  def accuracy_sv_bonus(accuracy)
    case accuracy
      when 1..4
        -4
      when 5..9
        -2
      when 10..34
        0
      when 35..44
        2
      when 45..54
        4
      when 55..64
        6
      when 65..74
        8
      when 75..84
        10
      when 85..94
        12
      when 95..105
        14
      when 106..300
        (16 + ((@accuracy - 106) / 5))
    end
  end

  #### Character climbing trait value, Hub Rules p. 36 #####
  def character_climbing_ability
    (@strength + @agility) / 2
  end
  ############ Table TME-1-8, Swimming Ability, Hub Rules p. 16 ############
  def swimming_results(roll)
    case roll
      when 0..3
        "Can't Swim"
      when 4..5
        "Poor Swimmer"
      when 6..7 
        "Fair Swimmer"
      when 8..9
        "Strong Swimmer"
      when 10..30
        "Excellent Swimmer"
    end

    if @caste == "Fisher" || "Pirate"
      @swimming_skill = swimming_results(d(6) + 4)
    else
      @swimming_skill = swimming_results(d(10))
    end
  end 
  #### Table TME-1-9, Character Starting Age Category, Hub Rules p. 17 #####
  def character_age
    if @@race.include? "Bestial Human"
      @@starting_age = @@starting_age
    else @@starting_age = (d(8) + 17)
    end
  end 
  ############ Table TME-1-7, Hand Dominance, Hub Rules p. 16 ############

  def which_hand(roll)
    case roll
      when 1..7
        "Right"
      when 8..9
        "Left"
      when 10 
        "Ambidextrous"
    end


    @dominant_hand = which_hand(rand(1..10))

    puts "Your character's hand dominance is #{@dominant_hand}"
  end

  ##### Table TME-1-6, Character Weight and Height, Hub Rules p. 16 #####
  def height_and_weight(race, gender)
    weight = 0
    height = 0
    case race
      when "Pure Stock Human"
        weight = 40 + d(20) + d(20)
        height = 140 + d(20) + d(20) + d(20)
        if gender == "Male"
          weight += 20
          height += 20
        end
      when "Clone, Comfort"
        weight = 50 + d(10)
        height = 150 + d(10)
        if gender == "Male"
          weight += 10
          height += 30
        end
      when "Clone, Labor"
        weight += 60 + d(20)
        height += 160 + d(10) + d(10) + d(10)
        if gender == "Male"
          weight += 10 + d(20)
          height += 20
        end
      when "Clone, Military"
        weight += 60 + d(20) + d(20)
        height += 170 + d(10)
        if gender == "Male"
          weight += 10 + d(20)
          height += 10 + d(10)
        end
      when "Bioreplica, Pleasure"
        weight += 45 + d(20) #because apparently thin is in even after the apocalypse?!?!
        height += 150 + d(20)
        if gender == "Male"
          weight += 10
          height += 18
        end
      when "Bioreplica, Industrial"
        weight += 50 + d(20) + d(20)
        height += 160 + d(20) + d(20)
        if gender == "Male"
          weight += 16 + d(20)
          height += 20
        end
      when "Bioreplica, Clerical"
        weight += 50 + d(12)
        height += 150 + d(20)
        if gender == "Male"
          weight += 10
          height += 20
        end
      when "Bioreplica, Infiltration"
        weight += 60 + d(20)
        height += 150 + d(10) + d(10) + d(10)
        if gender == "Male"
          weight += 10
          height += 15
        end
      when "Bioreplica, Battle"
        weight += 50 + d(20) + d(20)
        height += 175 + d(20)
        if gender == "Male"
          weight += 10
          height += 10
        end
      when "Trans-Human"
        weight += 50 + d(20) + d(20)
        height += 165 + d(20)
        if gender == "Male"
          weight += 10 + d(20)
          height += 15
        end
      when "Cyborg"
        weight += 65 + d(10) + d(10)
        height += 140 + d(20) + d(20) + d(20)
        if gender == "Male"
          weight += 10
          height += 20
        end
      when "Bestial Human"
        weight = @character_weight
        height = @character_height
      when "Ghost Mutant"
        weight = 50 + d(20)
        height = 150 + d(20) + d(20)
        if gender == "Male"
          weight += 10
          height += 20
        end
      when "Mutant, Mild" || "Mutant, Typical" || "Mutant, Severe" || "Mutant, Freakish Horror"
        weight += 40 + d(20) + d(20)
        height += 130 + d(20) + d(20) + d(20) + d(20)
        if gender == "Male"
          weight += 20
          height += 20
        end
    end
    @character_weight = weight
    @character_height = height
  end

  def display_character_sheet
    puts "Here's your finished Mutant Epoch character!"
    puts "Character Race: #{@race}"
    puts "Pre-game Caste: #{@caste}"
    puts "==ATTRIBUTES=="
    puts "ENDURANCE: #{@endurance}     Healing rate: #{@endurance_healing_rate}"
    puts "STRENGTH: #{@strength}     Dmg mod: #{@damage_modifier}     Range bonus: #{@strength_range}%"
    puts "AGILITY: #{@agility}     MV mod: #{@agility_move_bonus}     DV mod: #{@dv_agility_modifier}"
    puts "ACCURACY: #{@accuracy}     SV mod: #{@accuracy_SV_bonus}"
    puts "INTELLIGENCE: #{@intelligence}"
    puts "WILLPOWER: #{@willpower}"
    puts "PERCEPTION: #{@perception}     Initiative mod: #{@perception_initiative_modifier}"
    puts "APPEARANCE: #{@appearance}"
    puts "INITIATIVE MODIFIER: #{@initiative}"
    puts "Movement Rate: #{@movement_rate_base} or #{@movement_rate_armored}"
    if @movement_rate_flying != 0
      puts "Movement rate flying: #{@movement_rate_flying}"
      # note: NO calculation made with flying MV minus armor?? have to doublecheck...
    end
    puts "Base Defense Value: #{@dv} / Armored Defense Value: #{@dv_armored}"
    if @dv_flying != 0
      puts "Flying Defense Value: #{@dv_flying}"
    end
    puts "Base Strike Value: #{@base_strike_value}"
    puts ""
    puts "==ATTACK MODES=="
    puts "Attack mode ==== SV == Rate == Range == Damage == Ammo == Skill pts == Skill SV bonus == Skill dmg == Ref == Notes"
    @attacks.each do |n|
      puts n
    end
    puts ""
    puts "==ARMOR=="
    puts "Location ===== DV ===== MV Mod ===== Type"

    @armor.each do |armor|
      puts armor
    end
    if @race == "Cyborg"
      puts "==IMPLANTS=="
      @off_implants.each do |n|
        puts n
      end
      @def_implants.each do |n|
        puts n
      end
      @misc_implants.each do |n|
        puts n
      end
    end

    if @race.include? "Mutant"
      puts "==MUTATIONS=="
      @ghost_mutations.each do |n|
        puts n
      end
      @minor_mutations.each do |n|
        puts n
      end
      @primary_mutations.each do |n|
        puts n
      end
      @flaw_mutations.each do |n|
        puts n
      end

    end

    puts "==SKILLS==" #should reference skill_sums hash for skill - level -- maybe fix that with a proper def initialize?
    @skills.each do |skill, level|
      puts skill, level
    end
    puts ""
    puts "==EQUIPMENT=="
    puts "Equipment starting pack code: #{@outfittingcode}"
    @equipment.each do |item|
      puts item
    end
    puts "Days' rations: #{@days_rations}"
    puts "Liters of water: #{@liters_water}"
    puts "Debts: #{@debts}"
    puts "Valuables carried: #{@valuables_carried}"
    puts "Money: #{@money}"
    puts ""
    puts "==CHARACTER NOTES=="
    @character_notes.each do |note|
      puts note
    end
  ##### Cosmetic stuff #####
    puts "Gender: #{@gender}"
    puts "Orientation: #{@sexual_orientation}"
    puts "Weight: #{@character_weight}"
    puts "Height: #{@character_height}"
    puts "Skin color: #{@skin_color}"
    puts "Hair color: #{@hair_color}"
    puts "Eye color: #{@eye_color}"
    @languages_spoken.each do |lang|
      puts lang
    end
    @diseases_or_parasites.each do |dop|
      puts dop
    end
    if @bounty_offered != "No"
      puts "Bounty on character: #{@bounty_value} value."
    end
    puts "Literacy: #{@literacy}"
    puts "Numeracy: #{@do_math}"
    puts "Swimming: #{@swimming_skill}, swimming MV #{@movement_rate_swimming}"
    puts "Climbing ability: #{@climbing_ability}"
    puts "Dominant hand: #{@dominant_hand}"
    puts "Starting age: #{@starting_age}"

  end




end 
######## Table TME-1-12 Bioreplica Trait Determination by Model Type, Hub Rules p. 19 ########
class Pure_stock_human < Character


  def psh_bonuses(roll)
    ######## Pure Stock Human bonuses table TME-11 ########
    case roll
    when 1..5
      @skills << "Brawling"
      puts "Brawling skill"
    when 6..10
      @skills << "Stealth"
      puts "Stealth skill"
    when 11..15
      @skills << "Weapons Expert"
      puts "Wpn expert!"
    when 16..20
      @skills << "Dodge"
      puts "Dodge skill"
    when 21..37
      @endurance += 1
      @strength += 1
      @agility += 1
      @accuracy += 1
      @willpower += 1
      @intelligence += 1
      @perception += 1
      @appearance += 1
      puts "+1 to each attribute"
    when 38..44
      @endurance += (d(6) + d(6))
      puts "+2d6 endurance"
    when 45..51
      @strength += (d(6) + d(6))
      puts "+2d6 strength"
    when 52..58
      @agility += (d(6) + d(6))
      puts "+2d6 agility"
    when 59..65
      @accuracy += (d(6) + d(6))
      puts "+2d6 accuracy"
    when 66..74
      @intelligence += (d(6) + d(6) + d(6))
      puts "+3d6 intelligence"
    when 75..83
      @willpower += (d(6) + d(6))
      puts "+2d6 willpower"
    when 84..90
      @appearance += (d(6) + d(6) + d(6))
      puts "+3d6 appearance"
    when 91..97
      @skills << "Martial Arts"
      puts "Martial arts skill!"
    when 98..99
      @endurance += 2
      @strength += 2
      @agility += 2
      @accuracy += 2
      @willpower += 2
      @intelligence += 2
      @perception += 2
      @appearance += 2
      puts "+2 to each attribute"
    when 100
      @endurance += d(6)
      @strength += d(6)
      @agility += d(6)
      @accuracy += d(6)
      @willpower += d(6)
      @intelligence += d(6)
      @perception += d(6)
      @appearance += d(6)
      puts "JACKPOT -- +d6 to EACH Attribute!"
    end
  end

  def pure_stock_human_bonuses
    puts "Hey, congratulations -- purebloods like you get two rolls on the Pure Stock Human Starting Bonus Table"
    psh_roll_1 = d(100)
    psh_roll_2 = d(100)
    puts "Your first roll is #{psh_roll_1} and your second roll is #{psh_roll_2}"

    # Execute the 2 Pure Stock Human bonus rolls...
    psh_bonuses(psh_roll_1)
    psh_bonuses(psh_roll_2)

    #here's the  manual part...
    psh_attribute_bonus = 10
    puts "Pure stock humans have 10 bonus points to assign to any attribute."
    while psh_attribute_bonus > 0
      puts "To assign your remaining #{psh_attribute_bonus} points, type:"
      puts "E for Endurance (currently #{@endurance})"
      puts "S for Strength (currently #{@strength})"
      puts "A for Agility (currently #{@agility})"
      puts "C for Accuracy (currently #{@accuracy})"
      puts "W for Willpower(currently #{@willpower})"
      puts "I for Intelligence(currently #{@intelligence})"
      puts "P for Perception(currently #{@perception})"
      puts "F for Appearance (F for face - currently #{@appearance})"
      puts "Or enter R to randomly assign ALL your remaining bonus points because you're lazy."
      response = gets.chomp.upcase
      case response
      when "E"
        @endurance += 1
        psh_attribute_bonus -= 1
      when "S"
        @strength += 1
        psh_attribute_bonus -= 1
      when "A"
        @agility += 1
        psh_attribute_bonus -= 1
      when "C"
        @accuracy += 1
        psh_attribute_bonus -= 1
      when "W"
        @willpower += 1
        psh_attribute_bonus -= 1
      when "I"
        @intelligence += 1
        psh_attribute_bonus -= 1
      when "P"
        @perception += 1
        psh_attribute_bonus -= 1
      when "F"
        @appearance += 1
        psh_attribute_bonus -= 1
      when "R"
        def psh_attributes_bonus_random(roll)
          case roll
          when 1
            @endurance += 1
          when 2
            @strength += 1
          when 3
            @agility += 1
          when 4
            @accuracy += 1
          when 5
            @willpower += 1
          when 6
            @intelligence += 1
          when 7
            @perception += 1
          when 8
            @appearance += 1
          end
        end

        psh_attribute_bonus.times do
          psh_attributes_bonus_random(d(8))
          psh_attribute_bonus -= 1
        end

      else
        puts "I didn't understand... try again."
      end
    end

  end

  def initialize
    super
    @race = "Pure Stock Human"
    pure_stock_human_bonuses
  end
end

class Bioreplica_pleasure < Character
  def initialize
    super
    @race = "Bioreplica, Pleasure"
    @endurance = (18 + d(20))
    @strength = (15 + d(20))
    @agility = (30 + d(20) + d(20))
    @intelligence = (10 + d(20))
    @perception = (20 + d(20))
    @willpower = (10 + d(20))
    @appearance = (50 + d(100))
  end
end

class Bioreplica_industrial < Character
  def initialize
    super
    @race = "Bioreplica, Industrial"
    @endurance = (50 + d(20) + d(20) + d(20))
    @strength = (60 + d(20) + d(20) + d(20))
    @agility = (30 + d(20))
    @accuracy = (30 + d(20))
    @intelligence = (10 + d(20))
    @perception = (18 + d(20))
    @willpower = (20 + d(20) + d(20))
    @appearance = (10 + d(10) + d(10))
  end
end

class Bioreplica_clerical < Character
  def initialize
    super
    @race = "Bioreplica, Clerical"
    @endurance = (15 + d(10) + d(10))
    @strength = (15 + d(10) + d(10))
    @agility = (30 + d(20) + d(20))
    @accuracy = (30 + d(20) + d(20))
    @intelligence = (40 + d(20) + d(20))
    @perception = (10 + d(20) + d(20) + d(20))
    @willpower = (15 + d(20) + d(20))
    @appearance = (20 + d(20) + d(20) + d(20))
  end
end

class Bioreplica_infiltration < Character
  def initialize
    super
    @race = "Bioreplica, Infiltration"
    @endurance = (40 + d(20) + d(20))
    @strength = (35 + d(20) + d(20))
    @agility = (60 + d(20) + d(20) + d(20))
    @accuracy = (60 + d(20) + d(20) + d(20))
    @intelligence = (40 + d(20) + d(20))
    @perception = (50 + d(20) + d(20) + d(20))
    @willpower = (20 + d(20) + d(20) + d(20))
    @appearance = (10 + d(20) + d(20) + d(20))
  end
end

class Bioreplica_battle < Character
  def initialize
    super
    @race = "Bioreplica, Battle"
    @endurance = (60 + d(100))
    @strength = (60 + d(20) + d(20) + d(20))
    @agility = (40 + d(20) + d(20) + d(20))
    @accuracy = (50 + d(20) + d(20) + d(20))
    @intelligence = (10 + d(20) + d(20))
    @perception = (30 + d(20) + d(20))
    @willpower = (40 + d(20) + d(20))
    @appearance = (10 + d(20) + d(20))
  end
end

# in addition bioreplica are 3d20 in actual age despite appearing to be an adult in their prime
# Bioreplica have a secret termination date 3d100 years from the start of game play... just like Bladerunner!!

######## END Table TME-1-12 ########

######## Table TME-1-13, Clone Trait Determination by Model Type, Hub Rules P. 20 ########

class Clone_comfort < Character
  def initialize
    super
    @race = "Clone, Comfort"
    @endurance = (15 + d(10) + d(10))
    @strength = (10 + d(10) + d(10))
    @agility = (20 + d(20) + d(20) + d(20))
    @accuracy = (20 + d(20) + d(20))
    @intelligence = (10 + d(20) + d(20))
    @perception = (20 + d(20) + d(20))
    @willpower = (10 + d(10))
    @appearance = (60 + d(100))
  end
end

class Clone_labor < Character
  def initialize
    super
    @race = "Clone, Labor"
    @endurance = (50 + d(20) + d(20))
    @strength = (50 + d(20) + d(20))
    @agility = (40 + d(20))
    @accuracy = (40 + d(20))
    @intelligence = (15 + d(20))
    @perception = (20 + d(20) + d(20))
    @willpower = (24 + d(10) + d(10))
    @appearance = (10 + d(20))
  end
end

class Clone_military < Character
  def initialize
    super
    @race = "Clone, Military"
    @endurance = (40 + d(20) + d(20) + d(20) + d(20))
    @strength = (40 + d(20) + d(20) + d(20) + d(20))
    @agility = (50 + d(20) + d(20) + d(20))
    @accuracy = (50 + d(20) + d(20) + d(20))
    @intelligence = (27 + d(20) + d(20))
    @perception = (58 + d(20) + d(20))
    @willpower = (30 + d(20) + d(20))
    @appearance = (10 + d(20) + d(20))
  end
end

######## END Table TME-1-13 ########

######## Table TME-1-14 Trans-Human Traits, Hub Rules p. 20 ########
class Trans_human < Character
  def initialize
    super
    @race = "Trans-Human"
    #puts "#{@endurance}"
    @endurance += (d(20 + d(20)))
    #    puts "#{@endurance}" used these lines to make sure we were generating original values and then adding -- it totally worked!
    @strength += (d(10))
    @agility += (d(20))
    @intelligence += (d(20) + 10)
    @perception += (d(10))
    @willpower += (d(10))
    @appearance += (d(6) + d(6))
  end
end
######## END Table TME-1-14 ########

######## Cyborg implants, Hub Rules p. 21 & Table TME-1-62, Hub Rules p. 84 ########
# class Cyborg < Character #BROKEN 

#   attr_accessor :off_implants, :def_implants, :misc_implants, :implants #-- probably unnecessary because I'm setting all these within the class?
#   def initialize
#     super
#     @off_implants = d(2)
#     @def_implants = d(2)
#     @misc_implants = d(3)
#     @implants = []
#   end

#   def weapon_arm_roll(roll2) # Hub Rules p. 92
#     case roll2
#     when 1..4
#       @implants << "Weapon Arm ~ Razor Sword"
#     when 5..9
#       @implants << "Weapon Arm ~ Spring Spike"
#     when 10..14
#       @implants << "Weapon Arm ~ Discsaw"
#       @equipment << "Discsaw #{d(4)} power cells"
#     when 15..18
#       @implants << "Weapon Arm ~ Chainsaw"
#       @equipment << "Chainsaw #{d(4)} power cells"
#     when 19..21
#       @implants << "Weapon Arm ~ Laser Torch"
#       @equipment << "Laser torch #{d(4)} power cells"
#     when 22..25
#       @implants << "Weapon Arm ~ Stun stick"
#       @equipment << "Stun stick #{d(6)} mini power cells"
#     when 26..29
#       @implants << "Weapon Arm ~ Stun Pistol"
#       @equipment << "Stun pistol #{d(6)} power cells"
#     when 30..35
#       @implants << "Weapon Arm ~ Laser sword"
#       @equipment << "Laser sword #{d(6)} power cells"
#     when 36..39
#       @implants << "Weapon Arm ~ Assault shotgun"
#       @equipment << "Assault shotgun #{d(2)} 40-round drum, #{d(20)} loose shells"
#     when 40..43
#       @implants << "Weapon Arm ~ Sniper rifle"
#       @equipment << "Sniper rifle #{d(2)} full mags, #{d(20)} loose HCR shells"
#     when 44..50
#       @implants << "Weapon Arm ~ Submachine gun"
#       @equipment << "SMG #{d(2)} full mags, #{d(100)} loose pistol rounds"
#     when 51..60
#       @implants << "Weapon Arm ~ Assault rifle"
#       @equipment << "AR #{d(3)} full mags, #{d(100)} loose rifle rounds"
#     when 61..64
#       @implants << "Weapon Arm ~ Rocket launcher"
#       @equipment << "#{(d(6) + d(6))} battle rockets"
#     when 65..68
#       @implants << "Weapon Arm ~ Flamethrower"
#       @equipment << "Flamethrower #{(d(6) + 1)} fuel canisters"
#     when 69..76
#       @implants << "Weapon Arm ~ Chain gun"
#       @equipment << "Chain gun ammo drum (200-rd) and #{d(100)} loose rifle rounds"
#     when 77..79
#       @implants << "Weapon Arm ~ Chain gun"
#       @equipment << "Chain gun ammo belt pack with #{d(100) + 100} rifle rounds"
#     when 80..84
#       @implants << "Weapon Arm ~ Heavy machine gun"
#       @equipment << "HMG 100-round drum and #{d(100)} loose HCR rounds"
#     when 85..87
#       @implants << "Weapon Arm ~ Heavy machine gun"
#       @equipment << "HMG ammo belt pack with #{d(100) + 100} HCR rounds"
#     when 88..92
#       @implants << "Weapon Arm ~ Laser carbine"
#       @equipment << "Laser carbine #{d(6) + 1} power cells"
#     when 93..94
#       @implants << "Weapon Arm ~ Heavy laser carbine"
#       @equipment << "HLC #{d(6) + 1} power cells"
#     when 95..96
#       @implants << "Weapon Arm ~ Pulse rifle"
#       @equipment << "Pulse rifle #{d(6) + 1} power cells"
#     when 97
#       @implants << "Weapon Arm ~ Pulse rifle"
#       @equipment << "Pulse rifle power pack: 250 bursts"
#     when 98
#       @implants << "Weapon Arm ~ Heavy pulse rifle"
#       @equipment << "Heavy pulse rifle #{d(6) + 1} power cells"
#     when 99
#       @implants << "Weapon Arm ~ Light laser cannon (cyborg mod)"
#       @equipment << "1 light laser cannon power pack"
#     when 100
#       2.times do
#         weapon_arm_roll(d(100))
#       end
#     end

#   end

#   def offensive_implants_results(roll)
#     # Unless implant name marked with ~ (which allows for multiple augmentation), always reroll if an implant occurs twice UNLESS otherwise designated by NPC or creature description. ** indicates "for organic beings only" -- androids and robotics reroll.

#     case roll
#       when 1..6
#         @implants << "Alloy Razor Claws"
#         @attacks << {:attack_mode => "Punch", :SV => 0, :rate => 1, :range => 0, :damage => 0, :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0}
#       when 7..10
#         @implants << "Fold Out Manipulator Arm ~"
#         @attacks << {:attack_mode => "Punch", :SV => 0, :rate => 1, :range => 0, :damage => 0, :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0}
#       when 11..14
#         @implants << "Hypodermic Tendril ~"
#         @attacks << {:attack_mode => "Punch", :SV => 0, :rate => 1, :range => 0, :damage => 0, :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0}
#       when 15..18
#         @implants << "Manipulator Tendril ~"
#         @attacks << {:attack_mode => "Punch", :SV => 0, :rate => 1, :range => 0, :damage => 0, :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0}
#       when 19..24
#         @implants << "Pincer ~"
#         @attacks << {:attack_mode => "Punch", :SV => 0, :rate => 1, :range => 0, :damage => 0, :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0}
#       when 25..30
#         @implants << "Power Arm ~"
#         @attacks << {:attack_mode => "Punch", :SV => 0, :rate => 1, :range => 0, :damage => 0, :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0}
#       when 31..36
#         @implants << "Retractable Laser Pistol ~"
#         @attacks << {:attack_mode => "Punch", :SV => 0, :rate => 1, :range => 0, :damage => 0, :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0}
#       when 37..39
#         @implants << "Shoulder Turret"
#         @attacks = {:attack_mode => "Punch", :SV => 0, :rate => 1, :range => 0, :damage => 0, :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0}
#       when 40..45
#         @implants << "Telescoping Thrust Blade"
#         @attacks = {:attack_mode => "Thrust Blade Implant", :SV => "+60/+8", :rate => 1, :range => "2m", :damage => "d20+10", :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "92", :notes => "+60SV and +5 initiative to first attack per combat, +8SV after"}
#       when 46..50
#         @implants << "Tentacle ~"
#         @attacks = {:attack_mode => "Tentacle Implant", :SV => "+10", :rate => 1, :range => "3m", :damage => "d12 + 4 stun or lethal", :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "92", :notes => "Tentacle has DV -20, END 20"}
#         @appearance = [@appearance - (d(6) + 3), 1].max
#       when 51..100
#         weapon_arm_roll(d(100))
#     end 
#   end

#   def defensive_implants_results(roll)
#     case roll
#     when 1..8
#       @implants << "Anti Toxin Array **"
#     when 9..48
#       @implants << "Armor Enhancement ~"
#     when 49..55
#       @implants << "Electrical Defense Mechanism"
#     when 56..59
#       @implants << "Energy Absorption Cell"
#     when 60..73
#       @implants << "Force Field Generator"
#     when 74..79
#       @implants << "Force Shield"
#     when 80..84
#       @implants << "Mental Defense Screen"
#     when 85..87
#       @implants << "Optical Concealment Generator"
#     when 88..92
#       @implants << "Radiation Leeching Unit"
#     when 93..95
#       @implants << "Smoke Screen Generator"
#     when 96..97
#       @implants << "Sonic Defense Screen"
#     when 98..100
#       @implants << "Stun Inhibitor Device"
#     end
#   end

#   def misc_implants_results(roll)
#     case roll
#     when 1..7
#       @implants << "Artificial Heart **"
#     when 8..13
#       @implants << "Atmospheric Hydro Converter"
#     when 14..18
#       @implants << "Back-Up Sensor Array"
#     when 19..23
#       @implants << "Communication Implant ~"
#     when 24..27
#       @implants << "Computerized Brain"
#     when 28..30
#       @implants << "Cybernetic Legs"
#     when 31..33
#       @implants << "Detachable Lower Arm"
#     when 34..36
#       @implants << "Floodlight Orb"
#     when 37..41
#       @implants << "Grappling Hook"
#     when 42..46
#       @implants << "Hover Jets"
#     when 47..51
#       @implants << "Hydraulic Walker Legs"
#     when 52..54
#       @implants << "Internal Gyroscope"
#     when 55..58
#       @implants << "Internal Healer Drones"
#     when 59..61
#       @implants << "Internal Nutriment Supply"
#     when 62..64
#       @implants << "Iron Stomach"
#     when 65..67
#       @implants << "Loudspeaker"
#     when 68..69
#       @implants << "Mini-Robotics Hanger"
#     when 70..79
#       @implants << "Optical Enhancement ~"
#     when 80..83
#       @implants << " Oxygen Supply Unit"
#     when 84..86
#       @implants << "Panoramic Optics Node"
#     when 87..89
#       @implants << "Portable Computer Station"
#     when 90..91
#       @implants << "Radio Scanner"
#     when 92..93
#       @implants << "Self Destruct Mode"
#     when 94..95
#       @implants << "Sensor Probe Launcher"
#     when 96..97
#       @implants << "Solar Power Generator"
#     when 98
#       @implants << "Surveillance Tendril ~"
#     when 99..100
#       @implants << "Tracked Locomotion"
#     end
#   end

# ## GETTING undefined method errors and WTF is d? errors on the three tasks below. ???

# rand(1..2).times do
#   offensive_implants_results(rand(1..100))
# end

# @def_implants.times do
#   defensive_implants_results(d(100))
# end

# d(3).times do
#   misc_implants_results(d(100))
# end

# end
module Mutant_determination_lookups
  ##### Table TME-2-7, Random Body Location, Hub Rules p. 106 #####
  include Sub

  def random_body_location(roll)
    case roll
    when 1
      "head"
    when 2
      "neck"
    when 3
      "torso"
    when 4
      "groin"
    when 5
      "right hand"
    when 6
      "left hand"
    when 7
      "right lower arm"
    when 8
      "right upper arm"
    when 9
      "right shoulder"
    when 10
      "left shoulder"
    when 11
      "left upper arm"
    when 12
      "left lower arm"
    when 13
      "butt"
    when 14
      "right thigh"
    when 15
      "right shin"
    when 16
      "right foot"
    when 17
      "left thigh"
    when 18
      "left shin"
    when 19
      "left foot"
    when 20
      "back"
    end
  end

  ##### End random body location table #####

  ##### Table TME-1-57, Prime Mutation Determination, Hub Rules p. 58 #####

  def prime_mutation_determination(roll)
    case roll
    when 1..9
      @primary_mutations << "Acid Blood"
      @attacks << {:attack_mode => "Acid blood spray", :SV => 20, :rate => 1, :range => 2, :damage => "d12", :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "60", :notes => "automatic on melee or point-blank puncturing attack"}

    when 10..20
      @primary_mutations << "Acid Spit"
      @attacks << {:attack_mode => "Acid Spit", :SV => 6, :rate => 1, :range => 6, :damage => "d6 + 2 per dround for d6 rounds", :ammo => "2/day", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "60", :notes => "does same damage to ropes, bars, locks, etc."}
    when 21..32
      @primary_mutations << "Advanced Mind"
      @intelligence += (d(10 + d(10) + d(10)))
      @character_notes << "character gains two hazard checks against insanity and mental attacks that require hazard checks"

    when 33..36
      @primary_mutations << "Agony Sphere"
      @attacks << {:attack_mode => "Agony Sphere", :SV => "auto", :rate => 1, :range => "#{@willpower/2}", :damage => "d6 and +10DV to targets", :ammo => "1 per day per mutant rank", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "60", :notes => "requires 3 full rounds of concentration to unleash and can be sustained for 1 rd per willpower point"}

    when 37..44
      @primary_mutations << "Amphibian"
      @character_notes << "Can breathe as well in water as air"
      @character_notes << "Suffers d3 dmg per day in arid environments"

    when 45..52
      @primary_mutations << "Amplification"
      @character_notes << "Doubles daily/rank-based rate of limited-use mutations"

    when 53..59
      @primary_mutations << "Aquatic Adaptation"
      @character_notes << "Webbed hands and feet"
      @character_notes << "Withstands cold 2x vs. humans"
      @character_notes << "Must be fully immersed in water 1hr per day or suffer d3 dmg; d6 in desert areas"

    when 60..71
      @primary_mutations << "Arid Adaptation"
      @dv -= 3
      @appearance = [@appearance - d(8), 1].max
      @character_notes << "Needs 1/10th as much water as pure stock human"
      @character_notes << "Specialized organ holds 2 liters drinking water (can yak up in 250 or 500ml portions)"

    when 72..79
      @primary_mutations << "Asphyxiation Zone"
      @attacks << {:attack_mode => "Asphyxiation Zone", :SV => "auto", :rate => 1, :range => (@willpower * 2), :damage => "d10", :ammo => "2/day per user rank", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "61", :notes => "lasts 2 rounds per rank"}

    when 80..89
      @primary_mutations << "Aura of Protection"
      @character_notes << "2 uses / rank / day; DV -10 + 10 pt force field dmg soak per round; duration willpower rounds; 2 rounds to activate"

    when 90..102
      @primary_mutations << "Ballistic Hide"
      @dv -= 4
      @appearance = [@appearance - d(4), 1].max
      @character_notes << "Additional -20DV vs. blunt/crushing attacks including non-AP bullets"

    when 103..109
      @primary_mutations << "Beak"
      @appearance = [@appearance - (d(6) + d(6)), 1].max
      @attacks << {:attack_mode => "Beak", :SV => 10, :rate => 1, :range => 1, :damage => "d12", :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "61", :notes => ""}
      @character_notes << "Character cannot speak clearly"

    when 110..127
      @primary_mutations << "Beam Eyes"
      @attacks << {:attack_mode => "Beam Eyes", :SV => 15, :rate => 1, :range => (@willpower + @perception), :damage => "10 + d6/rank", :ammo => "2 / rank / day", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "61", :notes => ""}

    when 128..134
      @primary_mutations << "Berserker Rage"
      @character_notes << "Berserker Rage: 2/day/rank usage; duration 1 battle; -5DV, +10SV, +10dmg (melee weapons only); +20 strength; can fight on for d6 rounds after suffering fatal damage"
    when 135..144
      @primary_mutations << "Bladed Limbs"
      bladed_limbs_number = d(4)
      def bladed_limbs_location(roll)
        case roll
        when 1 then
          result = "Shoulder"
        when 2 then
          result = "Back"
        when 3 then
          result = "Chest"
        when 4 then
          result = "Side"
        when 5 then
          result = "Hip"
        when 6 then
          result = "Abdomen"
        end
      end

      bladed_limbs_number.times do
        location = bladed_limbs_location(d(6))
        @character_notes << "Sword-like bone blade protruding from #{location}, #{d(20) + 29} cm in length."
        @appearance = [@appearance - 2, 1].max
        @character_weight += 5
        @attacks << {:attack_mode => "Bladed limb(s)", :SV => 5, :rate => "1 per bladed limb", :range => 0, :damage => "d12 + 2", :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "62", :notes => "Bladed limb on #{location}"}
      end




    when 145..149
      @primary_mutations << "Blurred Movement"
      @character_notes << "Blurred Movement: -20DV; willpower rounds/day; can be used to blur entire body or only parts"

    when 150..179
      @character_notes << "Due to body disporportion, no relic shell armor can be worn, but other types can be modified to fit"

      def body_disproportion_location(roll)
        case roll
        when 1
          @primary_mutations << "Body Disproportion: Dominant arm is massive!"
          @character_notes << "Dominant arm has strength of #{(@strength + @strength + d(20) + d(20))} which applies to all 1- and 2-handed melee weapons character wields"
          @appearance = [@appearance - d(4), 1].max
          @movement_rate_base -= 0.5
          @character_weight += (20 + d(20))
        when 2
          @primary_mutations << "Body Disproportion: Character's head is massive!"
          @intelligence += (d(20) + 20)
          @movement_rate_base -= 1
          @appearance = [@appearance - (d(4) + d(4)), 1].max
          @character_notes << "TWO intelligence-based hazard checks, when called for"
          @character_weight += (20 + d(10))
        when 3
          @primary_mutations << "Body Disproportion: Upper body incredibly over-muscled!"
          @strength += (20 + d(20))
          @endurance += (20 + d(20))
          @movement_rate_base -= 1
          @agility = [@agility - d(10), 1].max
          @appearance = [@appearance - (d(4) + d(4)), 1].max
          @character_weight += (20 + d(20) + d(20))
        when 4
          @primary_mutations << "Body Disproportion: hips and legs are twice normal length!"
          @movement_rate_base += @movement_rate_base
          @character_height += 100
          @appearance = [@appearance - d(4), 1].max
          @attacks << {:attack_mode => "Wicked kick", :SV => 0, :rate => "1", :range => 0, :damage => "2d10", :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "62", :notes => ""}
          @character_weight += (30 + d(20) + d(20))
        when 5
          @primary_mutations << "Body Disproportion: comically giant hands and feet!"
          @attacks << {:attack_mode => "Punch or kick", :SV => 0, :rate => "1", :range => 0, :damage => "2d12", :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "62", :notes => ""}
          @character_notes << "Weapons with triggers, keyboards, or other items requiring normal human hands are unusable without modifying item."
          @appearance = [@appearance - (d(6) + 1), 1].max
          @character_weight += (d(6) + d(6) + d(6) + d(6))
        when 6
          @primary_mutations << "Body Disproportion: extra long arms!"
          @character_notes << "+5 SV in melee combat"
          @character_notes << "+5 thrown weapon DMG"
          @appearance = [@appearance - (d(4) + 1), 1].max
        when 7
          @primary_mutations << "Body Disproportion: greatly elongated torso!"
          @character_notes << "If pregnant, gives birth to a litter of d4 + 1 offspring."
          @endurance += (d(10) + d(10))
          @appearance = [@appearance - d(6), 1].max
          @character_height += (20 + d(20))
          @character_weight += (10 + d(20))

          def elongated_torso_bonus(roll1, roll2, roll3, roll4) # need to add actual mutation results via primary_mutations_roll(xx)
            case roll1
            when 1..50
              @primary_mutations << "Reserve heart"
            end
            case roll2
            when 1..65
              @primary_mutations << "Radiation absorption"
            end
            case roll3
            when 1..37
              @primary_mutations << "Breath holding"
            end
            case roll4
            when 1..72
              @primary_mutations << "Nutriment cache"
            end

          end

          elongated_torso_bonus(d(100), d(100), d(100), d(100))
        when 8
          2.times do
            body_disproportion_location(d(7))
          end
        end

      end

      body_disproportion_location(d(8))

    when 180..195 # DEBUG: wrapped in a function; removed ref to @endurance_healing_rate because we haven't calculated it yet. Q: Better to calc endurance_healing_rate + bonus NOW and risk being wrong because END might change? How to write a func that recalcs every time END changes? 
      def body_regeneration_rate(roll)
        regeneration_heal_bonus = 0
        case roll
        when 1..12
          regeneration_heal_bonus = 4
        when 13..32
          regeneration_heal_bonus = 7
        when 33..40
          regeneration_heal_bonus = 10
        when 41..64
          regeneration_heal_bonus = 15
        when 65..87
          regeneration_heal_bonus = "1 pt per hour"
        when 88..93
          regeneration_heal_bonus = "2 pts per hour"
        when 94..96
          regeneration_heal_bonus = "4 pts per hour"
        when 97..98
          regeneration_heal_bonus = "6 pts per hour"
        when 99
          regeneration_heal_bonus = "10 pts per hour"
        when 100
          regeneration_heal_bonus = "1 pt per round"
        end
      

      body_regeneration_rate(d(100))
      @primary_mutations << "Body Regeneration: #{regeneration_heal_bonus} healing rate bonus, so doublecheck whether endurance heal rate is accurate."
    end

    when 196..201
      @primary_mutations << "Breath Holding: triple base endurance rate + regular breath holding rate (Hub Rules p. 122)"
    when 202..224
      @primary_mutations << "Claws:  don’t hinder her from using bows, crossbows, or weapons that use a trigger, but disallow her from using keyboards or doing fne electronics work"
      @attacks << {:attack_mode => "Claw", :SV => 7, :rate => "1 per hand", :range => 0, :damage => "d12 each", :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "62-63", :notes => ""}
      @character_notes << "Thanks to claws, character climbs as though she has 2 points in Climbing skill"
    when 225..230
      @primary_mutations << "Climbing Suckers: like a gecko, character can climb on anything at 1/2 move"
      @character_notes << "When falling, type A agility based hazard check to catch side of building/pit and stop fall"
    when 231..239
      @primary_mutations << "Coma Inducement"
      @attacks << {:attack_mode => "Coma inducement", :SV => 0, :rate => "", :range => @willpower + @willpower, :damage => "coma", :ammo => "2/day/rank", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "63", :notes => "victim gets tybe B willpower based hazard check; see p. 63 for details"}
    when 240..253
      puts "Crab pincers mutation!"
      def crab_pincers # DEBUG tried to fix some no method errors by wrapping all this into a single function -- does it work? 
        number_of_pincers = 0
        arms_too = "True"
        pincer_size = "Small"
        
        def pincer_formation_on_mutant(roll)
          case roll
          when 1..2
            @primary_mutations << "Crab Pincers: 1 pincer replacing 1 arm"
            number_of_pincers += 1
            @character_weight -= 15
          when 3..6
            @primary_mutations << "Crab Pincers: 2 pincers replacing both human arms"
            number_of_pincers += 2
            @character_weight -= 30
          when 7
            @primary_mutations << "Crab Pincers: 1 pincer growing from shoulder, both human arms intact"
            number_of_pincers += 1
          when 8..9
            @primary_mutations << "Crab Pincers: 2 pincers in addition to human arms"
            number_of_pincers += 2
          when 10
            number_of_pincers = (2 + d(2))

            def arms_too(roll)
              case roll
              when 79..100
                arms_too = "False"
                @character_weight -= 30
              end
            end

            @primary_mutations << "Crab Pincers: #{number_of_pincers} total"
            arms_too(d(100))
          end
        end

      def pincer_size(roll)
        case roll
        when 1..3
          pincer_size = "Small"
          @character_weight += (number_of_pincers * 15)
          @attacks << {:attack_mode => "Pincer", :SV => 2, :rate => "#{number_of_pincers}", :range => 0, :damage => "d10 + 1", :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "63", :notes => ""}
        when 4..6
          pincer_size = "Medium"
          @movement_rate_base -= (0.25 * number_of_pincers)
          @character_weight += (number_of_pincers * 20)
          @attacks << {:attack_mode => "Pincer", :SV => 4, :rate => "#{number_of_pincers}", :range => 0, :damage => "d12 + 3", :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "63", :notes => ""}
        when 7..9
          pincer_size = "Large"
          @movement_rate_base -= (0.5 * number_of_pincers)
          @character_weight += (number_of_pincers * 35)
          @attacks << {:attack_mode => "Pincer", :SV => 7, :rate => "#{number_of_pincers}", :range => 0, :damage => "d20 + 3", :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "63", :notes => ""}
        when 10
          pincer_size = "Massive"
          @movement_rate_base -= (0.75 * number_of_pincers)
          @character_weight += (number_of_pincers * 50)
          @attacks << {:attack_mode => "Pincer", :SV => 10, :rate => "#{number_of_pincers}", :range => 0, :damage => "d20 + 10", :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "63", :notes => ""}
        end
      end

      pincer_formation_on_mutant(d(10))
      pincer_size(d(10))
      @primary_mutations << "Pincers: #{number_of_pincers} of #{pincer_size} size"
      if arms_too == "False"
        @appearance = [@appearance - (number_of_pincers * d(4) + 2), 1].max
        @character_notes << "No human arms - character cannot use triggers, keyboards, or complex items"
        @character_weight -= 30
      elsif arms_too == "True"
        @appearance = [@appearance - (number_of_pincers * d(4)), 1].max
      end
    end 

    when 254..292
      def deviant_skin_structure(roll)
        case roll
        when 1..3
          @primary_mutations << "Fire-proof skin"
          @character_notes << "No damage from fire for 10 rounds; 1/2 damage after"
          @character_notes << "1/2 damage from explosions"
        when 4..5
          @primary_mutations << "Reflective skin"
          @character_notes << "1/2 damage from beam weapons when clothed; 70 percent resistance to beam weapons vs. bare skin"
          @appearance += d(6)
        when 6..7
          @primary_mutations << "Alkaline skin"
          @character_notes << "Character totally immune to acid attacks (which still ruin character's gear)"
        when 8..10
          @primary_mutations << "Weather sensitive skin"
          @character_notes << "Sense weather changes in 20km radius; can sense open bodies of water within 2 km"
        when 11
          @primary_mutations << "Glow in the dark skin"
          @character_notes << "3m radius green glow; visible up to 12km away - character can't turn off glow"
        when 12
          @primary_mutations << "Photosynthetic skin"
          @character_notes << "4 hrs in sunlight = 1 meal; 1 hr in sunlight = 3 pts healing (in addition to normal resting healing)"
        end
      end

      deviant_skin_structure(d(12))

    when 293..298
      @primary_mutations << "Devastator Pulse"
      @attacks << {:attack_mode => "Devastator Pulse", :SV => (@accuracy + @willpower), :rate => "4 rounds to charge, release on 5th", :range => @willpower, :damage => "3d20 / d100 + 40 vs. machines", :ammo => "1/rank/day", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "64", :notes => ""}

    when 299..300
      @primary_mutations << "Displacement"
      @character_notes << "Displacement: #{@willpower} rounds per day, DV -30"
    when 301..305
      @primary_mutations << "Doom Sphere"
      @attacks << {:attack_mode => "Doom Sphere", :SV => "01-95", :rate => "1/10 days", :range => (@willpower * 10), :damage => "3d20 vs organics; 6d20 vs electronics", :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "64", :notes => "User must make intelligence type B hazard check or go insane for 1 hour (p. 126)"}
    when 306..314
      @primary_mutations << "Dread Zone"
      @attacks << {:attack_mode => "Dread Zone", :SV => "01-95", :rate => 1, :range => @intelligence, :damage => "tybe B hazard check vs. intelligence or +10SV to attack", :ammo => "1/rank/day", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "64", :notes => "Duration: rank in rounds; does not affect inorganic beings or creatures with morale = n/a"}
    when 315..322
      @primary_mutations << "Earth Thump"
      @attacks << {:attack_mode => "Earth Thump", :SV => (@willpower + 30), :rate => "3 rounds to generate", :range => @willpower, :damage => "d10/user rank", :ammo => "2/day/rank", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "64", :notes => "Targets 1 human-sized enemy per rank of user (assuming multiple targets close together)"}
    when 323..341
      @primary_mutations << "Electrical Charge"
      @attacks << {:attack_mode => "Electrical Charge", :SV => 20, :rate => "1", :range => 0, :damage => "d20 + HC", :ammo => "2/day/rank", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "64", :notes => "Victim makes END-based tybe B hazard check or stunned for d3 rounds"}
      @character_notes << "Four Electrical Charge jolts are suffcient to fully re-charge a standard power cell."
    when 342..349
      @primary_mutations << "Electrical Pulse"
      @attacks << {:attack_mode => "Electrical Pulse", :SV => 20, :rate => 1, :range => (@willpower), :damage => "d20 / 3d20 vs machines", :ammo => "3/day/rank", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "65", :notes => "Can be used to start fires as well"}
    when 350..355
      @primary_mutations << "Electro Magnetic Pulse"
      @attacks << {:attack_mode => "Electro Magnetic Pulse", :SV => 30, :rate => 1, :range => @willpower, :damage => "d10/d100 vs electronics", :ammo => "2/day/rank", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "65", :notes => ""}
    when 356..376
      @primary_mutations << "Empathy"
      @character_notes << "Empathy: #{@willpower} range. Unlimited uses. The subject is allowed a type C, intelligence based hazard check. If failed, mutant knows victim's emotions. Alternately, emotions can be projected."
    when 377..388
      @primary_mutations << "Energy Blade"

      def energy_blade_type(roll) # table Hub Rules p. 65
        case roll
        when 1..20
          @attacks << {:attack_mode => "Energy Blade: Blue", :SV => 10, :rate => 1, :range => 1, :damage => "d12", :ammo => "#{@willpower} rounds", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "65", :notes => "2/day/rank"}
        when 21..40
          @attacks << {:attack_mode => "Energy Blade: Green", :SV => 10, :rate => 1, :range => 1, :damage => "d20 stun", :ammo => "#{@willpower} rounds", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "65", :notes => "2/day/rank"}
        when 41..65
          @attacks << {:attack_mode => "Energy Blade: Red", :SV => 10, :rate => 1, :range => 1, :damage => "d20", :ammo => "#{@willpower} rounds", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "65", :notes => "2/day/rank"}
        when 66..85
          @attacks << {:attack_mode => "Energy Blade: Orange", :SV => 10, :rate => 1, :range => 1, :damage => "2d20 stun", :ammo => "#{@willpower} rounds", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "65", :notes => "2/day/rank"}
        when 86..97
          @attacks << {:attack_mode => "Energy Blade: Purple", :SV => 10, :rate => 1, :range => 1, :damage => "2d20", :ammo => "#{@willpower} rounds", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "65", :notes => "2/day/rank"}
        when 98..99
          @attacks << {:attack_mode => "Energy Blade: White", :SV => 10, :rate => 1, :range => 1, :damage => "d100 stun", :ammo => "#{@willpower} rounds", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "65", :notes => "2/day/rank"}
        when 100
          @attacks << {:attack_mode => "Energy Blade: Gold", :SV => 10, :rate => 1, :range => 1, :damage => "d100", :ammo => "#{@willpower} rounds", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "65", :notes => "2/day/rank"}
        end
      end

      if @primary_mutations.include? "Energy Blade" # Note: NO duplication -- reroll if this result comes up twice.
        @primary_mutations_rolls += 1
      else
        energy_blade_type(d(100))
      end

    when 389..401
      @primary_mutations << "Extreme Size Decrease"
      @character_height = (22 + d(20) + d(20)) # NOTE: should be dependent on GENDER, ignored that.
      3.times do 
        @skills << "Stealth"
      end 
      2.times do 
        @skills << "Climbing"
      end 
      @character_notes << "Cannot wield two-handed weapons. Normal one-handed weapons including pistols must be employed with both hands (except knifes and daggers, which are considered swords for this mutant)"
      @character_notes << "Relic armor cannot be worn except scrap relic."

      def extreme_size_decrease(height) # Hub Rules p. 65
        case height
        when 22..27
          @character_weight = (15 + d(10))
          @agility += 20
          @movement_rate_base == 4.5
          @strength = [@strength - 15, 1].max
          @endurance = [@endurance - 10, 1].max
        when 28..35
          @character_weight = (20 + d(12))
          @agility += 15
          @movement_rate_base = 5
          @strength = [@strength - 10, 1].max
          @endurance = [@endurance - 7, 1].max
        when 36..45
          @character_weight = (25 + d(20))
          @agility += 10
          @movement_rate_base = 5.5
          @strength = [@strength - 5, 1].max
          @endurance = [@endurance - 5, 1].max
        when 46..65
          @character_weight = (30 + d(20) + d(20))
          @agility += 7
          @movement_rate_base = 6
          @strength = [@strength - 3, 1].max
          @endurance = [@endurance - 3, 1].max
        end
      end

      extreme_size_decrease(@character_height)

    when 402..419
      def fang_size(roll) # Hub rules p. 65
        case roll
        when 1..3
          sizeoffangs = "Small"
          fangsv = 2
          fangdmg = "d6"
          @appearance = [@appearance - 1, 1].max
        when 4..8
          sizeoffangs = "Medium"
          fangsv = 4
          fangdmg = "d10"
          @appearance = [@appearance - (1 + d(2)), 1].max
        when 9..10
          sizeoffangs = "Huge"
          fangsv = 6
          fangdmg = "d20"
          @appearance = [@appearance - (d(3) + 2), 1].max
          @character_notes << "Ability to speak clearly greatly reduced"
        end
        @attacks << {:attack_mode => "Fangs", :SV => fangsv, :rate => 1, :range => 0, :damage => fangdmg, :ammo => "2/day/rank", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "65", :notes => "This attack can only be employed as a supplemental melee attack if involved in close fighting"}
        @primary_mutations << "Fanged: #{sizeoffangs} size"
      end

      fang_size(d(10))

    when 420..427
      @primary_mutations << "Flame Breath"
      @attacks << {:attack_mode => "Flame Breath", :SV => 10, :rate => 1, :range => "3/rank", :damage => "d6/rd for 2d6 rds", :ammo => "2/day/rank", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "66", :notes => "Up to 3 man sized targets can be attacked at once if close together"}
    when 428..438
      def force_field_strength(roll) # Hub rules p. 66
        case roll
        when 1..10
          force_field = d(10)
        when 11..24
          force_field = (d(10) + 3)
        when 25..53
          force_field = (d(10) + 5)
        when 54..78
          force_field = (d(10) + 10)
        when 79..94
          force_field = (d(10) + 12)
        when 95
          force_field = (d(10) + 15)
        when 96
          force_field = (d(10) + 17)
        when 97
          force_field = (d(10) + 20)
        when 98
          force_field = (d(10) + 23)
        when 99
          force_field = (d(10) + 26)
        when 100
          force_field = (d(10) + 30)
        end
        @primary_mutations << "Force Field: 2 uses/rank/day; #{willpower} rounds duration; absorbs #{force_field} dmg/round"
      end

      force_field_strength(d(100))

    when 439..445
      @primary_mutations << "Foul Flesh"
      @character_notes << "Will not eat mutant: all mammals, all humanoids except moaners, horrlify, all amphibians, fsh, birds except black vultures, reptilius, all reptiles, except alligators and crocodilians."
    when 446..453
      def furred_mutation(roll)
        case roll
        when 1..3
          fur_type = "Fine, cat-like"
          fur_dv = -3
          fur_cold = "Double normal human cold resistance"
          @appearance = [@appearance - d(3), 1].max
        when 4..5
          fur_type = "Wool, sheep-like"
          fur_dv = -6
          fur_cold = "Triple normal human cold resistance"
          @appearance = [@appearance - (1 + d(4)), 1].max
        when 6..7
          fur_type = "Thick, sheep-like wool"
          fur_dv = -9
          fur_cold = "Quadruple normal human cold resistance"
          @appearance = [@appearance - (d(6) + 2), 1].max
        when 8..9
          fur_type = "Badger-like bristles"
          fur_dv = -11
          fur_cold = "Double normal human cold resistance"
          @appearance = [@appearance - (d(6) + d(6) + 2), 1].max
          @character_notes << "+2 dmg to basic punch attack" # +2 dmg to punch attack -- HOW to implement??
        when 10
          fur_type = "Porcupine-like quills"
          fur_dv = -13
          fur_cold = "Double normal human cold resistance"
          @appearance = [@appearance - (d(6) + d(6) + 3), 1].max
          @character_notes << "+2 dmg to basic punch attack" # +2 dmg to punch attack -- HOW to implement??
        end
        @primary_mutations << "Furred: #{fur_type}, #{fur_cold} cold resistance. #{fur_dv} DV bonus"
        @dv += fur_dv
      end

      furred_mutation(d(10))
    when 454..459

      def gaseous_discharge(roll) # Hub Rules p. 67
        case roll
        when 1..2
          gas_type = "Sleep"
          gas_effect = "All must make an Endurance-based type A hazard check or pass out for d100 rounds."
        when 3..4
          gas_type = "Blindness"
          gas_effect = "All must make an Endurance-based type A hazard check or go blind for d6 days."
        when 5
          gas_type = "Stink"
          gas_effect = "All must make an Endurance-based type C hazard check or spend 2 rounds vomiting, becoming +30 to strike, with their own SV being reduced to half, rounded down."
        when 6
          gas_type = "Corrosive"
          gas_effect = "All must make an Endurance-based type B hazard check suffer d6 damage/rd from corrosive acids. Those who succeed vs. hazard check take 1 dmg/rd."
        when 7
          gas_type = "Hallucinogenic"
          gas_effect = "All must make an Intelligence-based tybe B hazard check or hallucinate, +30SV to strike and -30SV to retaliate. Animals must make a morale check or flee immediately."
        when 8
          gas_type = "Poison"
          gas_effect = "All must make an Endurance-based type A hazard check or drop unconscious for 10 rounds. Their breathing ceases on the 11th round and if not resuscitated by artifcial respiration, will die on the 14th round."
        end
        @primary_mutations << "Gaseous Discharge: #{gas_type}"
        @attacks << {:attack_mode => "Gaseous Discharge: #{gas_type}", :SV => "Auto", :rate => 1, :range => "10 m radius", :damage => "Special", :ammo => "2/day", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "66-67", :notes => "#{gas_effect} Gas dissipates in 2 rounds outdoors or lingers 2d10 + 4 rounds in enclosed areas."}
        @character_notes << "Character immune to #{gas_type}"
      end

      gaseous_discharge(d(8))

    when 460..472
      def gaping_maw(roll) #Hub Rules p. 67
        case roll
        when 1..5
          maw_size = "Large"
          maw_sv = 4
          maw_damage = "d12"
          maw_mv_mod = 0
          maw_added_weight = 15
          maw_appearance = (d(4,2)+2)
        when 6..7
          maw_size = "Huge"
          maw_sv = 7
          maw_damage = "d20"
          maw_mv_mod = 0.25
          maw_added_weight = 30
          maw_appearance = (d(4,2)+4)
        when 8..9
          maw_size = "Massive"
          maw_sv = 12
          maw_damage = "2d20"
          maw_mv_mod = 0.5
          maw_added_weight = 70
          maw_appearance = (d(6,2)+5)
        when 10
          maw_size = "Colossal"
          maw_sv = 20
          maw_damage = "3d20"
          maw_mv_mod = 1
          maw_added_weight = 120
          maw_appearance = (d(6,2)+8)
        end
        @primary_mutations << "Gaping Maw: #{maw_size} in size"
        @attacks << {:attack_mode => "Gaping Maw", :SV => maw_sv, :rate => 1, :range => 0, :damage => maw_damage, :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "67", :notes => "Can be employed as a supplemental melee attack "}
        @character_notes << "Almost totally carnivorous diet. Mutant drools and spits when speaking in a low, gruff voice difficult for strangers to understand."
        @character_weight += maw_added_weight
        @movement_rate_base -= maw_mv_mod
        # @appearance.sub(maw_appearance) undefined method "sub"
        # @appearance = [@appearance - maw_appearance, 1].max #this should work
        @appearance -= [maw_appearance, 1].max # testing this line instead of above 

      end

      gaping_maw(d(10))


    when 473..497
      def heal_touch(willpower)
        case willpower
        when 1..6
          healrate = "d8"
        when 7..14
          healrate = "d12"
        when 15..34
          healrate = "d20"
        when 35..64
          healrate = "d20 + 10"
        when 65..84
          healrate = "d20 + 20"
        when 85..105
          healrate = "d20 + 30"
        when 106..200
          healrate = "d20 + 40"
        end
        @primary_mutations << "Heal Touch: 2/day/rank, #{healrate} trait points healed. Diseases healed if victim makes Type B willpower based hazard check."
      end

      heal_touch(@willpower)

      @primary_mutations << "Heal Touch"
    when 498..511
      def heat_pulse(willpower) # Hub Rules p. 67
        case willpower
        when 1..6
          heat_pulse_sv = -5
          heat_pulse_dmg = "d6"
          heat_pulse_range = 5
        when 7..14
          heat_pulse_sv = 0
          heat_pulse_dmg = "d10"
          heat_pulse_range = 10
        when 15..34
          heat_pulse_sv = 4
          heat_pulse_dmg = "d20"
          heat_pulse_range = @willpower
        when 35..64
          heat_pulse_sv = 6
          heat_pulse_dmg = "d20 + 10"
          heat_pulse_range = (@willpower * 2)
        when 65..84
          heat_pulse_sv = 9
          heat_pulse_dmg = "d20 + 20"
          heat_pulse_range = (@willpower * 3)
        when 85..105
          heat_pulse_sv = 12
          heat_pulse_dmg = "d20 + 30"
          heat_pulse_range = (@willpower * 4)
        when 106..200
          heat_pulse_sv = 15
          heat_pulse_dmg = "d20 + 40"
          heat_pulse_range = (@willpower * 5)
        end
        @primary_mutations << "Heat Pulse"
        @attacks << {:attack_mode => "Heat Pulse", :SV => heat_pulse_sv, :rate => 1, :range => heat_pulse_range, :damage => heat_pulse_dmg, :ammo => "2/day/rank", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "67", :notes => ""}
      end

      heat_pulse(@willpower)


    when 512..556

      def heightened_attributes(roll) # Hub Rules p. 68
        case roll
        when 1
          heightened_attributes_type = "Cat Balance"
          @agility += (d(20) + 20)
          @accuracy += (d(10) + d(10))
          @perception += (d(20) + d(20))
          @appearance += d(10)
          2.times do 
            @skills << "Stealth"
          end 
          @character_notes << "Due to cat balance, character always gets two hazard checks when agility or accuracy are involved."
        when 2
          heightened_attributes_type = "Eagle Eyes"
          @accuracy += (d(10) + d(10))
          @perception += (d(10) + d(10) + d(10))
          @character_notes << "Due to eagle eyes, character sees 10x better than typical human, including at night."
        when 3..4
          heightened_attributes_type = "Strength"
          @strength += (d(20) + 30)
          @appearance += (d(10) + d(10))
          @character_notes << "Due to heightened strength, character always gets two hazard checks when strength involved."
        when 5..6
          heightened_attributes_type = "Endurance"
          @endurance += (d(20) + 30)
          @character_notes << "Due to heightened endurance, character always gets two hazard checks when endurance involved (eg, poison)."
        when 7
          heightened_attributes_type = "Hand-Eye Coordination"
          @accuracy += (d(20) + 20)
          @character_notes << "Due to superior hand-eye coordination, character always gets two hazard checks when accuracy involved."
        when 8
          heightened_attributes_type = "Beauty"
          @appearance += (d(20) + 30)
          @agility += d(6)
          @accuracy += d(6)
          @strength += d(6)
          @character_notes << "Due to heightened beauty, character always gets two hazard checks when appearance involved."
        when 9
          heightened_attributes_type = "Auditory"
          @dv -= 5
          @character_notes << "+2 initiative when operating alone or more than 10m from companions."
          @character_notes << "Sonic attacks do double damage, while crying babies, crowded pubs, and other intense noises are painful."
          @character_notes << "Due to heightened hearing, character receives 4 attempts on hazard checks related to listening/hearing."
        when 10
          heightened_attributes_type = "Olfactory"
          (d(2) + 1).times do 
            @skills << "Tracking"
          end 
          @character_notes << "Due to heightened sense of smell, character gets no hazard checks vs. stink-based attacks."
          @character_notes << "Character cannot be fooled by illusions at less than 10m"
          @character_notes << "Bloodhound-like tracking abilities; however, after 12 hours, or rain, sand storms, or crossing water, all result in lost trails."
        when 11
          heightened_attributes_type = "Willpower"
          @willpower += (d(20) + 30)
          @character_notes << "Due to heightened willpower, character always gets two hazard checks when willpower involved."
        when 12
          heightened_attributes_type = "Intelligence"
          @intelligence += (d(20) + 30)
          @character_notes << "Due to heightened intelligence, character always gets two hazard checks when intelligence involved."
        end
        @primary_mutations << "Heightened Attributes: #{heightened_attributes_type}"
      end

      heightened_attributes(d(12))


    when 557..566
      number_of_horns = d(4)
      @primary_mutations << "Horns: #{number_of_horns} on head"
      @character_weight += (2 * number_of_horns)
      @attacks << {:attack_mode => "Horns", :SV => (3 * number_of_horns), :rate => 1, :range => 0, :damage => "#{number_of_horns}d10", :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "68", :notes => "This attack can be employed as a supplemental melee attack"}
      @character_notes << "Due to horns, character can't wear relic helmets or shell-class armor unless horns permanently removed."
    when 567..571
      @primary_mutations << "Image Multiplication: #{@willpower} duration, 2 uses/day/rank. Up to #{@willpower / 10.floor} images of mutant's self created. Hub Rules p. 68"
    when 572..578
      def image_projection(intelligence)
        case intelligence
        when 1..9
          image_projection_range = "1 km"
          image_projection_duration = "d4 rounds"
        when 10..34
          image_projection_range = "#{@intelligence / 2} km"
          image_projection_duration = "2d4 rounds"
        when 35..54
          image_projection_range = "#{@intelligence} km"
          image_projection_duration = "10 + d10 rounds"
        when 55..74
          image_projection_range = "#{@intelligence * 2} km"
          image_projection_duration = "20 + d20 rounds"
        when 75..94
          image_projection_range = "#{@intelligence * 100} km"
          image_projection_duration = "100 + d100 rounds"
        when 95..200
          image_projection_range = "anywhere within solar system"
          image_projection_duration = "200 + 2d100 rounds"
        end
        @primary_mutations << "Image Projection: #{image_projection_range} range, #{image_projection_duration} duration. 1/rank/day. Illusion can repeat 2 words/round. Creatures with 35+ intelligence can make a type B intelligence based hazard check to recognize projection as an illusion. Hub Rules p. 69"
      end

      image_projection(@intelligence)

    when 579..603
      def immunity_mutation(roll)
        case roll
        when 1..2
          @primary_mutations << "Poison immunity: totally immune to all forms of poison. Also, cannot get drunk."
        when 3..4
          @primary_mutations << "Disease immunity: All forms of infection, disease, sickness, parasites, etc. don't affect character. Immune to parasites as well."
        when 5..6
          @primary_mutations << "Radiation immunity: unaffected by all forms of radiation."
        end
      end

      immunity_mutation(d(6))

    when 605..613
      @primary_mutations << "Increased Cellular Activity"
      @endurance_healing_rate = (@endurance_healing_rate * 3)
      @character_notes << "Character suffers no ill effects from aging (only benefits) and will live forever if not killed in combat, disease, poison, or accident."
    when 614..617
      @primary_mutations << "Light Burst: 10m radius, 2/day/rank"
      @attacks << {:attack_mode => "Light Burst", :SV => 0, :rate => 1, :range => 0, :damage => 0, :ammo => "1/day/rank", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "69", :notes => "Type C agility HC or blinded for 2d5 rounds. Blindness: -2 MV, -20 SV, +20 SV to be struck."}
    when 618..624
      @primary_mutations << "Limb Regeneration: see Hub Rules p. 69 for regeneration rates."
    when 625..630
      def mandibles_mutation(roll)
        case roll
        when 1..2
          mandibles_size = "Small"
          mandibles_sv = 3
          mandibles_dmg = "d10"
          mandibles_weight = 5
          mandibles_appearance = -(d(4) + 3)
        when 3..5
          mandibles_size = "Medium"
          mandibles_sv = 5
          mandibles_dmg = "d12"
          mandibles_weight = 15
          mandibles_appearance = -(d(6) + 4)
        when 6..7
          mandibles_size = "Large"
          mandibles_sv = 8
          mandibles_dmg = "d20"
          mandibles_weight = 20
          mandibles_appearance = -(d(8) + 6)
          @movement_rate_base -= 0.25
        when 8..9
          mandibles_size = "Huge"
          mandibles_sv = 11
          mandibles_dmg = "d20 + 5"
          mandibles_weight = 30
          mandibles_appearance = -(d(6) + d(6) + 5)
          @movement_rate_base -= 0.5
        when 10
          mandibles_size = "Massive"
          mandibles_sv = 15
          mandibles_dmg = "d20 + 10"
          mandibles_weight = 40
          mandibles_appearance = -(d(6) + d(6) + d(6) + 6)
          @movement_rate_base -= 1

        end

        @attacks << {:attack_mode => "Mandibles", :SV => mandibles_sv, :rate => 1, :range => 0, :damage => mandibles_dmg, :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "69", :notes => "Can be employed as a supplemental melee attack"}
        @character_weight += mandibles_weight
        @appearance += mandibles_appearance #due to implementation method no protection here from =< 0...
        @primary_mutations << "Mandibles: #{mandibles_size} size"
      end

      mandibles_mutation(d(10))

    when 631..641
      @primary_mutations << "Mental Mine"
    when 642..655
      @primary_mutations << "Mental Screen"
    when 656..687
      @primary_mutations << "Mind Crush"
    when 688..693
      @primary_mutations << "Mind Waste"
    when 694..699
      @primary_mutations << "Monstrous Morph"
    when 700..718
      def multi_arm_mutation(roll) # Hub Rules p. 71
        case roll
        when 1..10
          additional_arms = 1
        when 11..85
          additional_arms = 2
        when 86..90
          additional_arms = 3
        when 91..97
          additional_arms = 4
        when 98
          additional_arms = 5
        when 99
          additional_arms = 6
        when 100
          additional_arms = (d(6) + 6)
        end
        if additional_arms % 2 == 1
          def odd_arm_side(roll)
            case roll
            when 1
              odd_arm = "right"
            when 2
              odd_arm = "left"
            end
            #odd_arm_side(d(2))
            @character_notes << "Odd arm is on the #{odd_arm_side(d(2))} side."
          end


        end

        @primary_mutations << "Multi-Arm: #{additional_arms} additional arms"
      end

      multi_arm_mutation(d(100))

    when 719..728
      def multi_head # DEBUG: trying to fix undefined local var error by wrapping all in a function.
        def multi_head_mutation(roll)
          case roll
          when 1..70
            additional_heads = 1
            multi_head_appearance = -d(4)
            multi_head_mv = 0
            multi_head_initiative = 1
          when 71..88
            additional_heads = 2
            multi_head_appearance = -(d(4) + 1)
            multi_head_mv = 0.25
            multi_head_initiative = 1
          when 89..95
            additional_heads = 3
            multi_head_appearance = -(d(6) + 2)
            multi_head_mv = 0.5
            multi_head_initiative = 2
          when 96..97
            additional_heads = 4
            multi_head_appearance = -(d(6) + 4)
            multi_head_mv = 0.75
            multi_head_initiative = 2
          when 98..99
            additional_heads = 5
            multi_head_appearance = -(d(6) + 6)
            multi_head_mv = 1
            multi_head_initiative = 3
          when 100
            additional_heads = 6
            multi_head_appearance = -(d(6) + 8)
            multi_head_mv = 1.25
            multi_head_initiative = 4
          end

          @primary_mutations << "Multi-Head: #{additional_heads} additional heads."
          @appearance += multi_head_appearance
          @movement_rate_base -= multi_head_mv
          @initiative += multi_head_initiative
          @character_notes << "Heads tend to sleep at different times, with wakeful heads acting as lookout."

          while extra_heads > 0 do
            intelligence = attributes_roll(d100)
            wisdom = attributes_roll(d100)
            puts "Extra head no. #{extra_heads} has INT of #{intelligence} and WIS of #{wisdom}"

            def extra_head_mutations(roll2)
              case roll2
              when 1..62
                extra_head_mutation = ghost_mutations(d(100))
                @primary_mutations << extra_head_mutation
                @character_notes << "Extra head no. #{extra_heads} has the mental mutation #{extra_head_mutation}" # HOW to pick just the name of the mental mutation??
              end
            end
          end
          additional_heads -= 1
        end

        multi_head_mutation(d(100))
      end
      

    when 729..738
      @primary_mutations << "Night Vision: can see as well at night as a typical human can in daylight (at least starlight must be present)."
    when 739..745
      @primary_mutations << "Peeling Radius"
      @attacks << {:attack_mode => "Peeling Radius", :SV => 0, :rate => 1, :range => 10, :damage => "d6/rd", :ammo => "2/day/rank", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "71", :notes => "10m radius. Automatic hit. Duration: 3 rds/rank"}
    when 746..754
      def poison_bite_mutation(roll1, roll2) # Hub Rules p. 71
        case roll1
        when 1..54
          poison_bite_strength = "A"
        when 55..84
          poison_bite_strength = "B"
        when 85..97
          poison_bite_strength = "C"
        when 98..99
          poison_bite_strength = "D"
        when 100
          poison_bite_strength = "E"
        end

        case roll2
        when 1..5
          poison_bite_type = "Death"
        when 6
          poison_bite_type = "Paralysis"
        when 7
          poison_bite_type = "Insanity"
        when 8..10
          poison_bite_type = "Sleep"
        end

        @primary_mutations << "Poison Bite: #{poison_bite_type} venom, strength #{poison_bite_strength}, 4/day. Sufficient to coat 4 arrows/darts or 1 blade per injection's worth of poison."
        @attacks << {:attack_mode => "Poison Bite", :SV => 0, :rate => 1, :range => 0, :damage => "d6 plus poison", :ammo => "4/day", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "71", :notes => "#{poison_bite_type} venom, #{poison_bite_strength} strength."}
      end

      poison_bite_mutation(d(100), d(10))


    when 755..760

      def poison_blood_mutation(roll1, roll2) # Hub Rules p. 71
        case roll1
        when 1..54
          poison_bite_strength = "A"
        when 55..84
          poison_bite_strength = "B"
        when 85..97
          poison_bite_strength = "C"
        when 98..99
          poison_bite_strength = "D"
        when 100
          poison_bite_strength = "E"
        end

        case roll2
        when 1..5
          poison_bite_type = "Death"
        when 6
          poison_bite_type = "Paralysis"
        when 7
          poison_bite_type = "Insanity"
        when 8..10
          poison_bite_type = "Sleep"
        end

        @primary_mutations << "Poison Blood: #{poison_bite_type} venom, #{poison_bite_strength} strength. Any creature biting mutant poisoned."

      end

      poison_blood_mutation(d(100), d(10))

    when 761..767
      paralysis_tendrils = d(6)
      @primary_mutations << "Paralysis Tendrils: #{paralysis_tendrils} 3m length grow from mutant's chest"
      @appearance = [@appearance - (4 * paralysis_tendrils), 1].max
      @attacks << {:attack_mode => "Paralysis Tendrils", :SV => 10, :rate => 1, :range => 3, :damage => "d12 stun, 2d20 vs machines", :ammo => "3/day/rank", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "72", :notes => "#{paralysis_tendrils} tendrils, each capable of attack 3/day/rank."}


    when 768..773
      @primary_mutations << "Radiation Absorption: mutant immune to radioactivity, except for radioactive weapons, which do half damage."
    when 774..780
      @primary_mutations << "Radiation Detection: automatically senses the presence of radiation within a twenty meter radius, including those rare sources found in special radiation using robots, relic weapons and life forms."
    when 781..786
      @primary_mutations << "Radioactive Pulse"
      @attacks << {:attack_mode => "Radioactive Pulse", :SV => 10, :rate => 1, :range => @willpower, :damage => "d20 plus radiation", :ammo => "1/day/rank", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "72", :notes => "Victim makes type B endurance hazard check or suffer medium exposure; then type A hazard check or suffer strong exposure."}
    when 787..794
      @primary_mutations << "Reserve Heart: If character deemed to be killed by poison or electricity, or a critical hit which specifcally states a piercing of the heart, she will appear to be quite dead for 2d20+10 rounds. After this comatose period without a pulse or heartbeat, her back up heart will suddenly kick in and induce 2d10 endurance of healing, bringing the character slowly back to life."
    when 795..802
      @primary_mutations << "Reserve Mind: back-up brain takes over in case of brain damage, unconsciousness, insanity, or lethal damage. Hub Rules p. 72"
    when 803..809
      @primary_mutations << "Scaled Skin"
      @dv -= 8
      @appearance = [@appearance - d(4), 1].max
      @character_notes << "Scaled skin: immune to damage from sunburn, sand storms, insect bites, and topical irritants."
    when 810..814
      @primary_mutations << "Serpentine Body: +4 mv on land or swimming"
      @dv -= 5
      serpent_body_length = d(3) + 1
      @character_weight += (40 * serpent_body_length)
      @appearance = [@appearance - (d(6) + 1), 1].max
      @movement_rate_base += 4
      @movement_rate_swimming += 4
      @character_notes << "Unable to wear relic shell class armor"
      @attacks << {:attack_mode => "Serpentine Body Strike", :SV => 0, :rate => 1, :range => serpent_body_length, :damage => "d20 stun", :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "72", :notes => "Constrict for d10 lethal dmg/rd after successful strike."}

    when 815..839
      def shell_mutation(roll) # Hub Rules p. 73
        case roll
        when 1..4
          shell_rating = "Light"
          shell_defense_value = 10
          shell_movement_penalty = 0.5
          shell_appearance_penalty = (d(4) + 1)
          shell_weight = 20
        when 5..7
          shell_rating = "Medium"
          shell_defense_value = 20
          shell_movement_penalty = 1
          shell_appearance_penalty = (d(6) + 2)
          shell_weight = 30
        when 8..9
          shell_rating = "Heavy"
          shell_defense_value = 30
          shell_movement_penalty = 1.5
          shell_appearance_penalty = (d(6) + 4)
          shell_weight = 40
        when 10
          shell_rating = "Extra Heavy"
          shell_defense_value = 40
          shell_movement_penalty = 2
          shell_appearance_penalty = (d(6) + 6)
          shell_weight = 50
        end
        @primary_mutations << "#{shell_rating} Shell: #{shell_defense_value} DV, -#{shell_movement_penalty} MV"
        @appearance = [@appearance - shell_appearance_penalty, 1].max
        @dv -= shell_defense_value
        @movement_rate_base -= shell_movement_penalty
        @character_weight += shell_weight
        @character_notes << "Due to Shell mutation, punches, kicks, head-butts etc. deal 2d6 dmg instead of typical d6."
        @character_notes << "Shell mutation: no relic armor OTHER than ballistic, riot, and bomb squad armor can be worn. Combat armor can be modified, d6+1 days."
      end

      shell_mutation(d(10))

    when 840..849
      def size_decrease_mutation(height)
        case height
        when 61..95
          @agility += (d(8) + d(8))
          @strength = [@strength - d(10), 1].max
          @endurance = [@endurance - (d(6) + d(6)), 1].max
          4.times @skills << "Stealth"
        when 66..90
          @agility += (d(6) + d(6))
          @strength = [@strength - d(8), 1].max
          @endurance = [@endurance - (d(4) + d(4)), 1].max
          3.times @skills << "Stealth"
        when 91..110
          @agility += (d(4) + d(4))
          @strength = [@strength - d(6), 1].max
          @endurance = [@endurance - d(6), 1].max
          2.times @skills << "Stealth"
        when 111..130
          @agility += d(6)
          @strength = [@strength - d(4), 1].max
          @endurance = [@endurance - d(4), 1].max
          2.times @skills << "Stealth"
        when 131..140
          @agility += d(6)
          @strength = [@strength - d(3), 1].max
          @endurance = [@endurance - 2, 1].max
          @skills << "Stealth"
        when 141..159
          @agility += d(4)
          @skills << "Stealth"
        when 160..199
          @agility += d(3)
          @skills << "Stealth"
        end
      end

      @character_height -= d(100)
      size_decrease_mutation(@character_height)
      @primary_mutations << "Size Decrease"
    when 850..860
      @primary_mutations << "Size Increase"
      @character_height += (d(100) + d(100) + d(100) + d(100))

      def size_increase_mutation(height) # Hub Rules p. 73
        case height
        when 164..184
          @strength += d(10)
          @endurance && @character_weight += (d(10) + 5)
        when 185..199
          @movement_rate_base += 0.25
          @strength += (d(10) + 5)
          @endurance && @character_weight += (d(10) + 10)
        when 200..250
          @movement_rate_base += 0.5
          @strength += (d(10) + 10)
          @endurance && @character_weight += (d(20) + 15)
        when 251..299
          @movement_rate_base += 0.75
          @strength += (d(20) + 15)
          @endurance && @character_weight += (d(20) + 20)
        when 300..350
          @movement_rate_base += 1
          @strength += (d(20) + 20)
          @endurance && @character_weight += (d(20) + 30)
        when 351..399
          @movement_rate_base += 1.25
          @strength += (d(20) + 30)
          @endurance && @character_weight += (d(20) + 40)
        when 400..425
          @movement_rate_base += 1.5
          @strength += (d(20) + 40)
          @endurance && @character_weight += (d(20) + 50)
        when 426..450
          @movement_rate_base += 1.75
          @strength += (d(20) + 50)
          @endurance && @character_weight += (d(20) + 60)
        when 451..475
          @movement_rate_base += 2
          @strength += (d(20) + 60)
          @endurance && @character_weight += (d(20) + 75)
        when 476..499
          @movement_rate_base += 3
          @strength += (d(20) + 75)
          @endurance && @character_weight += (d(20) + 88)
        when 500..525
          @movement_rate_base += 4
          @strength += (d(20) + 88)
          @endurance && @character_weight += (d(20) + 100)
        when 526..560
          @movement_rate_base += 5
          @strength += (d(20) + 100)
          @endurance && @character_weight += (d(20) + 130)
        when 561..580
          @movement_rate_base += 6
          @strength += (d(20) + 130)
          @endurance && @character_weight += (d(20) + 160)
        end
      end

      size_increase_mutation(@character_height)

    when 861..869
      def sonic_wave_radius_mutation(willpower) # Hub Rules p. 73
        case willpower
        when 1..9
          attack_radius = 1
          damage = "d4"
          deafness_duration = "1 minute"
        when 10..23
          attack_radius = 2
          damage = "d6"
          deafness_duration = "5 minutes"
        when 24..34
          attack_radius = 4
          damage = "d8"
          deafness_duration = "10 minutes"
        when 35..60
          attack_radius = 5
          damage = "d10"
          deafness_duration = "30 minutes"
        when 61..70
          attack_radius = 7
          damage = "d12"
          deafness_duration = "1 hour"
        when 71..80
          attack_radius = 9
          damage = "d20"
          deafness_duration = "2d4 hours"
        when 81..90
          attack_radius = 15
          damage = "d20 + 5"
          deafness_duration = "3d6 hours"
        when 91..100
          attack_radius = 20
          damage = "d20 + 10"
          deafness_duration = "d6 days"
        when 101..110
          attack_radius = 25
          damage = "d20 + 15"
          deafness_duration = "2d4 days"
        when 111..120
          attack_radius = 30
          damage = "d20 + 20"
          deafness_duration = "3d6 days"
        when 121..130
          attack_radius = 40
          damage = "d20 + 30"
          deafness_duration = "3d6 + 10 days"
        when 131..140
          attack_radius = 50
          damage = "d20 + 40"
          deafness_duration = "3d6 + 20 days"
        when 141..150
          attack_radius = 60
          damage = "d20 + 50"
          deafness_duration = "3d6 + 30 days"
        end

        @primary_mutations << "Sonic Wave Radius: 2/day/rank, #{attack_radius} radius, #{damage} damage, #{deafness_duration} deafness."
        @attacks << {:attack_mode => "Sonic Wave Radius", :SV => 100, :rate => 1, :range => attack_radius, :damage => damage, :ammo => "2/day/rank", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "73", :notes => "#{deafness_duration} deafness"}
      end

      sonic_wave_radius_mutation(@willpower)


    when 870..876
      @primary_mutations << "Spines: #{d(10) + 10} cm length, + d6 dmg to punch/kick"
      @dv -= (d(20) + 10)
      @appearance = [@appearance - (d(4) + d(4)), 1].max
      @character_notes << "Unable to wear relic armor unless spines are sawed off monthly."
    when 877..880
      @primary_mutations << "Sprint: 2/day/rank, duration 2d10 + rank rounds. -20DV (-20SV with misslie weapons) while sprinting OR double melee attack rate."
    when 881..886
      def stalked_eyes_mutation(roll)
        case roll
        when 1..67
          eye_stalks = (d(4) + 1)
          @primary_mutations << "Stalked eyes: mutant has #{eye_stalks} #{(d(20) + 10)} cm long instead of typical eyes."
        when 68..100
          eye_stalks = (d(3) + 1)
          @primary_mutations << "Stalked eyes: mutant has #{eye_stalks} #{(d(20) + 10)} cm long in addition to typical eyes."
        end

        @dv -= (eye_stalks * 3)
        @initiative += 2
        @appearance = [@appearance - (eye_stalks * d(6)), 1].max
      end

      stalked_eyes_mutation(d(100))

    when 887..892
      def stench_spray_location(roll) # Hub Rules p. 74
        case roll
        when 1..2
          location = "Groin"
        when 3..4
          location = "Stomach"
        when 5..6
          location = "Chest"
        when 7
          location = "Left armpit"
        when 8
          location = "Right armpit"
        when 9
          location = "Back"
        when 10
          location = "Butt"
        end

        stench_spray_app = (6 + d(6))
        @primary_mutations << "Stench Spray: #{20 + d(20) + d(20)} cm organ located on character's #{location}"
        @attacks << {:attack_mode => "Stench Spray", :SV => 10, :rate => 1, :range => (@strength / 2), :damage => "Special", :ammo => "2/day/rank", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "74", :notes => "Endurance-based type B hazard check or d6 + 1 rds vomiting, +30SV to strike, -30SV to attack others."}
        @character_notes << "Character's appearance -#{stench_spray_app} penalty after stench organ seen."

      end

      stench_spray_location(d(10))

    when 893..901
      @primary_mutations << "Strength Burst: 2/rank/day, 4 rds/rank duration, character's strength 4x regular amount. Contributes to strength-based hazard checks, melee damage, etc."
    when 902..909
      def stun_ray_launcher(roll)
        case roll
        when 1..17
          stun_location = "eyes"
        when 18..59
          stun_location = "left hand"
        when 60..101
          stun_location = "right hand"
        end

        @primary_mutations << "Stun Ray fired from #{stun_location}."
        @attacks << {:attack_mode => "Stun Ray", :SV => 10, :rate => 1, :range => (@willpower * 2), :damage => "2d20 stun, x2 vs machines", :ammo => "3/day/rank", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "74", :notes => "Stun damage fades after 1 hour."}
      end

      stun_ray_launcher(d(101))

    when 910..924
      def tail_mutation(roll) # Hub Rules p. 74
          tail_type = "None"
          tail_length = 0
          tail_agility_bonus = 0
          tail_move = 0
          tail_sv = 0
          tail_attack_dmg = "None"
          tail_move_water = 0      
        case roll
        when 1..2
          tail_type = "Club"
          tail_length = 1.5
          tail_agility_bonus = d(4)
          tail_move = -1
          tail_sv = 6
          tail_attack_dmg = "d12 + 2 lethal or stun"
        when 3
          tail_type = "Crocodile"
          tail_length = 1.7
          tail_agility_bonus = d(8)
          tail_move = -1
          tail_move_water = 4
          tail_sv = 5
          tail_attack_dmg = "d12 stun"
        when 4
          tail_type = "Dolphin"
          tail_length = 1.5
          tail_agility_bonus = d(6)
          tail_move = -1
          tail_move_water = 6
          tail_sv = 4
          tail_attack_dmg = "d12 stun"
        when 5
          tail_type = "Eagle"
          tail_length = 1
          tail_agility_bonus = d(6)
          tail_move = 1
          tail_sv = 0
          tail_attack_dmg = nil
        when 6
          tail_type = "Fish"
          tail_length = 1.3
          tail_agility_bonus = d(6)
          tail_move = -1
          tail_move_water = 5
          tail_sv = 4
          tail_attack_dmg = "d10 stun"
        when 7
          tail_type = "Fox"
          tail_length = 1.25
          tail_agility_bonus = (d(6) + d(6))
          tail_move = 1.5
          tail_sv = 0
          tail_attack_dmg = nil
        when 8
          tail_type = "Cat"
          tail_length = 1.5
          tail_agility_bonus = (d(8) + d(8))
          tail_move = 2
          tail_sv = 0
          tail_attack_dmg = nil
        when 9
          tail_type = "Whip"
          tail_length = (3 + d(4))
          tail_agility_bonus = d(6)
          tail_move = -0.25
          tail_sv = 4
          tail_attack_dmg = "d8"
          @character_notes << "Whip tail can be used as #{tail_length} rope."
        when 10..13
          tail_type = "Prehensile (monkey)"
          tail_length = 3
          tail_agility_bonus = (d(4) + d(4))
          tail_move = 1
          tail_sv = 0
          tail_attack_dmg = nil
          @character_notes << "Prehensile tail can wield dagger or knife for additional melee attack."
        when 14
          tail_type = "Newt"
          tail_length = 1.5
          tail_agility_bonus = d(8)
          tail_move = -1
          tail_move_water = 4
          tail_sv = 3
          tail_attack_dmg = "d10 stun"
        when 15
          tail_type = "Porcupine"
          tail_length = 0.75
          tail_agility_bonus = 0
          tail_move = -1
          tail_sv = 5
          tail_attack_dmg = "d12 + 1"
        when 16..17
          tail_type = "Rat"
          tail_length = 1.8
          tail_agility_bonus = d(6)
          tail_move = 0.5
          tail_sv = 0
          tail_attack_dmg = nil
          @character_notes << "Rat tail can wield dagger or knife for additional melee attack."
        when 18
          tail_type = "Scorpion"
          tail_length = 2
          tail_agility_bonus = d(6)
          tail_move = -1
          tail_sv = 8
          tail_attack_dmg = "d12 + Type A poison"
        when 19
          tail_type = "Spiked"
          tail_length = 1.75
          tail_agility_bonus = d(6)
          tail_move = -1
          tail_sv = 7
          tail_attack_dmg = "d12 + 3"
        when 20
          tail_type = "Bladed"
          tail_length = 2
          tail_agility_bonus = d(6)
          tail_move = -1
          tail_sv = 7
          tail_attack_dmg = "d20"
        end

        @primary_mutations << "Tailed: #{tail_type} tail of #{tail_length} m length."
        @appearance += tail_agility_bonus
        @movement_rate_base += tail_move
        @movement_rate_swimming += tail_move_water
        if tail_attack_dmg != nil
          @attacks << {:attack_mode => "#{tail_type} tail strike", :SV => tail_sv, :rate => 1, :range => tail_length, :damage => "#{tail_attack_dmg}", :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "74", :notes => ""}
        end
      end

      tail_mutation(d(20))

    when 925..936
      @primary_mutations << "Telekinesis"
    when 937..961
      @primary_mutations << "Telepathy"
    when 962..967
      def tentacle_mutation(roll)
        case roll
        when 1..28
          number_of_tentacles = (d(4) + d(4) + 2)
          @primary_mutations << "Tentacles: Mutant has #{number_of_tentacles} instead of arms."
        when 29..100
          number_of_tentacles = (d(4) + d(4))
          @primary_mutations << "Tentacles: Mutant has #{number_of_tentacles} in addition to arms."
        end

        @appearance = [@appearance - (number_of_tentacles * 2), 1].max
        2.times do 
          @skills << "Climbing"
        end 
        @character_notes << "Tentacles add #{number_of_tentacles * 0.5} m to character's climbing & swimming move rates."
        @character_notes << "Tentacles can wield simple melee weapons but lack the dexterity needed to operate a keyboard, stringed, or triggered weapon."
        @attacks << {:attack_mode => "Tentacle strike", :SV => 5, :rate => number_of_tentacles, :range => 0, :damage => "d8 stun", :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "75", :notes => "Tentacles gain unarmed combat modifiers, too."}
      end

      tentacle_mutation(d(100))

    when 968..975
      @primary_mutations << "Throwing Quills: fire 1/rd, up to 20/day"
      @dv -= 18
      @character_notes << "Due to quills, mutant cannot wear relic armor (except specially-designed junk or scrap relic armor)"
      @appearance = [@appearance - (d(4) + d(4)), 1].max
      @attacks << {:attack_mode => "Throwing Quill", :SV => 6, :rate => 1, :range => "#{(@strength / 2)}", :damage => "d10", :ammo => "20/day", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "76", :notes => "incl. strength and wpn expert skill modifiers"}

    when 976..982
      def thrust_spike_mutation(roll)
        case roll
        when 1
          poison = "type A death poison"
        when 2..10
          poison = "None"
        end
        thrust_spike_length = (d(4) + d(4))
        @primary_mutations << "Thrust Spike:  #{@thrust_spike_length} long."
        @character_notes << "After seeing thrust spike mutant's appearance score reduced for witness by d1- + 10." #obvious typo here
        if poison == "None"
          @attacks << {:attack_mode => "Thrust Spike", :SV => 0, :rate => 1, :range => thrust_spike_length, :damage => "d20", :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "76", :notes => "+30SV, 2d20 + 10 damage on first attack."}
        elsif poison != "None"
          @attacks << {:attack_mode => "Thrust Spike", :SV => 0, :rate => 1, :range => thrust_spike_length, :damage => "d20", :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "76", :notes => "+30SV, 2d20 + 10 damage on first attack. Also: #{poison}"}
        end
      end
      thrust_spike_mutation(d(10))


    when 983..986
      @primary_mutations << "Tusks"
      @attacks << {:attack_mode => "Tusk bite", :SV => 6, :rate => 1, :range => 0, :damage => "2d8 + 2", :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "76", :notes => "Additional melee attack per rd."}
      @appearance = [@appearance - (d(8) + 2), 1].max

    when 987..992
      @primary_mutations << "Webbed Hands: character nearly impossible to drown & can hold breath 2x normal. Double swim speed."
      @movement_rate_swimming += @movement_rate_swimming

    when 993..1000 # DEBUG: tried to fix by initializing variables above the def statements.
      def wings # DEBUG: now trying to fix by putting everything into one function... nil  is assigned to uninitialized variables 
        air_speed = 0 
        wing_type = nil
        wing_size = nil
        flight_mode = nil
        flying_dv = 0
        wing_attack_dmg = nil
        wing_weight = 0
        def wings_mutation(roll1, roll2) # Hub Rules p. 76
          case roll1
            when 1
              wing_type = "Bird"
              air_speed = 6
              @character_notes << "Bird wings are fragile - this character suffers double damage from fire and burst radius explosives like grenades and bombs."
            when 2
              wing_type = "Insect"
              air_speed = 3
              @character_notes << "Due to insect wings, character has -2 MV in enclosed spaces."
            when 3..6
              wing_type = "Bat"
          end

          case roll2
          when 1
            wing_size = "Tiny"
            flight_mode = "Glide only"
            air_speed += (d(6) + 10)
            flying_dv = -5
            wing_weight = 6
          when 2
            wing_size = "Small"
            flight_mode = "Flies poorly"
            air_speed += (d(6) + 12)
            flying_dv = -10
            wing_attack_dmg = "d4 stun"
            wing_weight = 12
          when 3..4
            wing_size = "Medium"
            flight_mode = "Flies normally"
            air_speed += (d(6) + 15)
            flying_dv = -14
            wing_attack_dmg = "d6 stun"
            wing_weight = 20
          when 5
            wing_size = "Large"
            flight_mode = "Flies normally"
            air_speed += (d(6) + 20)
            flying_dv = -20
            wing_attack_dmg = "d8 stun"
            wing_weight = 30
          when 6
            wing_size = "Vast"
            flight_mode = "Flies excellently"
            air_speed += (d(10) + 25)
            flying_dv = -25
            wing_attack_dmg = "d10 stun"
            wing_weight = 40
          end

          @primary_mutations << "Wings: #{wing_size} #{wing_type} wings. Mutant #{flight_mode} at #{air_speed} MV and #{flying_dv} DV when airborne."
          @movement_rate_flying += air_speed

          if wing_attack_dmg != nil
            @attacks << {:attack_mode => "Wing bash", :SV => 0, :rate => 2, :range => 0, :damage => "#{wing_attack_dmg}", :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "76", :notes => ""}
          end

          @character_notes << "Character able to fly at full air speed with full gear, arms, and armor. See Hub Rules p. 76 for more."
          @character_notes << "Due to wings, standard and relic armor must be modified and fitted to this character."


        end

        wings_mutation(d(6), d(6))

      end
    end 
  end

  ##### End Table TME-1-57 #####

  ##### Table TME-1-59, Ghost & Latent Mutations, Hub Rules p. 59 #####

  def ghost_mutations_determination(roll)
    case roll
    when 1..4
      "Advanced Mind"
    when 5..6
       "Agony Sphere"
    when 7..8
       "Asphyxiation Zone"
    when 9..10
       "Aura of Protection"
    when 11
       "Breath Holding"
    when 12..13
       "Coma Inducement"
    when 14..15
       "Devastator Pulse"
    when 16..17
       "Displacement "
    when 18..19
       "Doom Sphere"
    when 20..21
      "Dread Zone"
    when 22..23
      "Earth Thump"
    when 24..27
      "Electrical Pulse"
    when 28..30
       "Electro MagneticPulse"
    when 31..37
      "Empathy"
    when 38..41
      "Energy Blade"
    when 42..45
       "Force Field"
    when 46..51
      "Heal Touch"
    when 52..56
      "Heat Pulse"
    when 57..58
       "Image Multiplication"
    when 59..60
       "Image Projection"
    when 61..62
      "Light Burst"
    when 63..64
       "Mental Mine"
    when 65..67
       "Mental Screen"
    when 68..79
      "Mind Crush"
    when 80..81
      "Mind Waste"
    when 82..83
      "Peeling Radius"
    when 84..85
      "Radiation Detection"
    when 86
      "Radioactive Pulse"
    when 87
      "Reserve Heart"
    when 88..89
      "Reserve Mind"
    when 90
      "Sonic Wave Radius"
    when 91
       "Stun Ray"
    when 92..96
      "Telekinesis"
    when 97..00
      "Telepathy"
    end
  end

  ##### End Table TME-1-59 #####

  ##### Table TME-1-60, Minor Mutations, Hub Rules p. 59 #####

  def minor_mutations_determination(roll)
    case roll
    when 1..16
      def blood_color_alteration(roll) # Hub Rules p. 77
        case roll
        when 1
          "pink"
        when 2
          "lavender"
        when 3
          "violet"
        when 4
          "purple"
        when 5
          "white"
        when 6
          "copper"
        when 7
          "amber"
        when 8
          "lime green"
        when 9
          "aquamarine"
        when 10
          "emerald"
        when 11
          "olive"
        when 12
          "blue"
        when 13
          "green"
        when 14
          "turquoise"
        when 15
          "black"
        when 16
          "orange"
        when 17
          "gray"
        when 18
          "yellow"
        when 19
          "silver"
        when 20
          "clear"
        end
      end

      blood_color = blood_color_alteration(d(20))

      @minor_mutations << "Blood Color Alteration: mutant's blood is #{blood_color}-colored."
    when 17..21
      @minor_mutations << "Eye Lights: at will, mutant's eyes produce bright light beams, like spotlights, within 20m."
    when 22..23
      @minor_mutations << "Hibernation: mutant can sleep in a near-death state for up to 5 months, requiring no food or water."
    when 24..26
      @minor_mutations << "Longevity: Mutant ages at 1/2 typical rate."
    when 27..30
      @minor_mutations << "Nutriment Cache: mutant's body stores 40 days' worth of supplemental food. Cache refilled by 4 days of full meals."
    when 31..33
      @minor_mutations << "Offspring Link: an unbreakable telepathic link exists between mutant and parents or children. Only emotions or feelings can be communicated."
    when 34..91
      def physical_alterations_mutations(roll) # Hub Rules p. 77-78
        case roll
        when 1
          physical_alteration = "Three nostrils"
          @appearance = [@appearance - d(3), 1].max
        when 2
          physical_alteration = "Extra set of ears"
          @character_notes << "2x hearing range; 2x dmg from sonic attacks"
          @appearance = [@appearance - (d(4) + d(4)), 1].max
        when 3
          physical_alteration = "Two mouths, one above the other"
          @appearance = [@appearance - d(6), 1].max
        when 4
          physical_alteration = "Six fingers per hand."
        when 5
          physical_alteration = "Six toes per foot."
        when 6
          physical_alteration = "Extra breast."
        when 7
          physical_alteration = "Nose grew on forehead."
          @appearance = [@appearance - (d(6) + d(6)), 1].max
        when 8
          physical_alteration = "Pointed ears."
        when 9
          physical_alteration = "Extra joint in fingers and toes."
        when 10
          physical_alteration = "Third eye between others."
          @appearance = [@appearance - d(6), 1].max
          @accuracy += (d(4) + d(4))
        when 11
          physical_alteration = "Only four fingers per hand."
        when 12
          physical_alteration = "Only four toes per foot."
        when 13
          physical_alteration = "Legs 1/4 longer than usual."
          @appearance = [@appearance - d(3), 1].max
          @movement_rate_base += 2
        when 14
          extra_ribs = (d(4) + d(4))
          physical_alteration = "Extra #{extra_ribs} pairs of ribs."
          @appearance = [@appearance - extra_ribs, 1].max
          @endurance += (extra_ribs * 2)
          @character_height += (extra_ribs * 4)
        when 15
          physical_alteration = "Extra set of lungs."
          @endurance && @strength += 10
          @movement_rate_base += 1
        when 16
          physical_alteration = "Stubby tail, #{5 + d(12)} cm long."
        when 17
          physical_alteration = "Arms twice as long as normal."
          @character_notes << "In melee: +1 initiative, +5 SV, +4 dmg" # add SV and dmg bonus to ALL melee attacks...
          # @initiative += 1 Since bonus applies to melee only, left it in the notes instead of adjusting base initiative value.
          @appearance = [@appearance - d(6), 1].max
        when 18
          physical_alteration = "Longer neck #{(20 + d(20))} cm longer than typical."
          @appearance = [@appearance - d(2), 1].max
        when 19
          def bulbous_head_mutation(roll)
            case roll
            when 1..77
              ghost_mutations_rolls += d(2)
              physical_alteration = "Bulbous head with ghost mutations."
            when 78..100
              physical_alteration = "Bulbous head."
            end
            @appearance = [@appearance - (d(6) + d(6)), 1].max
            @intelligence += (d(20) + d(20))
          end

          bulbous_head_mutation(d(100))

        when 20
          physical_alteration = "Sunken, skull-like eye sockets."
          @appearance = [@appearance - (d(6) + 1), 1].max
        when 21
          physical_alteration = "Bulbous eyes."
          @appearance = [@appearance - (d(6) + 2), 1].max
          @initiative += 1
        when 22
          cone_head_height = (d(20) + d(20))
          physical_alteration = "Cone head #{cone_head_height} taller than typical."
          @appearance = [@appearance - (cone_head_height / 4), 1].max
          @intelligence += d(4)
          @character_height += cone_head_height
        when 23
          physical_alteration = "Oversized jaws."
          @appearance = [@appearance - (d(3) + 1), 1].max
          @character_notes << "Bite attack d6 + strength bonus"
        when 24
          physical_alteration = "Hunchbacked."
          @appearance = [@appearance - (d(6) + d(6)), 1].max
          @movement_rate_base -= 0.5
          @endurance += (d(6) + d(6) + d(6))
        when 25
          physical_alteration = "Deeply wrinkled skin."
          @appearance = [@appearance - (d(6) + d(6)), 1].max
        when 26
          physical_alteration = "Especially smooth, firm skin."
          @appearance += (d(6) + d(6))
        when 27
          physical_alteration = "Disheveled body/face."
          @movement_rate_base -= 0.5
          @agility = [@agility - d(6), 1].max
          @appearance = [@appearance - d(6), 1].max
        when 28
          physical_alteration = "Very balanced body/face"
          @movement_rate_base += 1
          @agility += d(6)
          @accuracy += d(6)
          @strength += d(6)
          @appearance += (d(6) + d(6))
        when 29
          physical_alteration = "Chafing voice."
        when 30
          physical_alteration = "Superior hand-eye coordination."
          @accuracy += (d(6) + d(6) + d(6))
        when 31
          physical_alteration = "Elongated chin"
          @appearance = [@appearance - d(3), 1].max
        when 32
          physical_alteration = "Mohawk-like ridge of hair down spine."
        when 33
          physical_alteration = "Beard grows in fork pattern (males only)"
        when 34
          physical_alteration = "Bony studs cover body"
          @appearance = [@appearance - (d(6) + d(6)), 1].max
          @dv -= (d(6) + d(6))
        when 35
          physical_alteration = "Skin and hair constantly oily."
          @appearance = [@appearance - d(3), 1].max
        when 36
          physical_alteration = "Spiked forearms"
          @appearance = [@appearance - d(6), 1].max
          @attacks << {:attack_mode => "Spiked forearm smash", :SV => 3, :rate => 2, :range => 0, :damage => "d10", :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "77", :notes => "Replaces standard punch."}
        when 37
          physical_alteration = "Increased immunity to alcohol - needs 2x to feel effects."
        when 38
          physical_alteration = "Sonic absorption organ, 1/2 dmg from all sonic attacks."
        when 39
          physical_alteration = "Spike on forehead #{5 + d(10)} cm long."
          @appearance = [@appearance - d(6), 1].max
          @attacks << {:attack_mode => "Forehead spike", :SV => 3, :rate => 1, :range => 0, :damage => "d12", :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "77", :notes => ""}
        when 40
          physical_alteration = "Chicken legs."
          @appearance = [@appearance - (d(4) + d(4)), 1].max
          @movement_rate_base += 2
          @attacks << {:attack_mode => "Chicken leg kick", :SV => 3, :rate => 1, :range => 0, :damage => "d12", :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "77", :notes => "Additional melee atack"}
        when 41
          physical_alteration = "Dog legs."
          @appearance = [@appearance - (d(6) + d(6)), 1].max
          @movement_rate_base += (d(6) + d(6) + 2)
        when 42
          physical_alteration = "Goat legs."
          @appearance = [@appearance - (d(6) + d(6)), 1].max
          @movement_rate_base += (d(8) + d(8) + 2)
        when 43
          physical_alteration = "Bat wings instead of arms, tipped with human hands."
        when 44
          physical_alteration = "Massive muscles."
          @movement_rate_base -= 0.5
          @character_weight += 30
          @strength += (30 + d(20))
          @endurance += (10 + d(10))
        when 45
          physical_alteration = "Barrel-shaped torso."
          @appearance = [@appearance - d(4), 1].max
          @strength += (d(8) + d(8))
          @endurance += (d(10) + d(10) + d(10))
        when 46
          physical_alteration = "Warty skin."
          @appearance = [@appearance - (d(4) + d(4)), 1].max
        when 47
          physical_alteration = "Large bulbous nose."
          @appearance = [@appearance - d(4), 1].max
        when 48
          physical_alteration = "Massive floppy ears."
          @appearance = [@appearance - d(8), 1].max
          @character_notes << "Due to massive floppy ears, 50 percent hearing increase."
        when 49
          physical_alteration = "Protruding veins."
          @appearance -= (d(4) + d(4))
        when 50
          physical_alteration = "Stocky legs."
          @appearance = [@appearance - d(3), 1].max
          @movement_rate_base -= 1
        when 51
          physical_alteration = "Broad, flat head, eyes wide apart, pancake-like face."
          @appearance = [@appearance - (d(6) + 3), 1].max
        when 52
          physical_alteration = "Lion-like mane, looks like a huge beard."
          @dv -= 2
          # females only @appearance -= (d(6) + d(6))
        when 53
          physical_alteration = "Horse tail."
          @agility += d(3)
        when 54
          physical_alteration = "Skull-like face, sunken features."
          @appearance = [@appearance - (d(6) + d(6) + 5), 1].max
        when 55
          physical_alteration = "Lizard tongue."
        when 56
          physical_alteration = "Huge, saggy cheeks."
          @appearance = [@appearance - (d(4) + d(4)), 1].max
        when 57
          feeding_tentacles = (d(6) + d(6))
          physical_alteration = "#{feeding_tentacles} around mutant's mouth."
          @appearance = [@appearance - (feeding_tentacles * 2), 1].max
        when 58
          physical_alteration = "Tongue #{(10 + d(20))} cm long."
        when 59
          physical_alteration = "Large, high forehead."
          @appearance = [@appearance - d(4), 1].max
          @intelligence += d(4)
        when 60
          extra_eyes = (d(6) + d(6))
          physical_alteration = "#{extra_eyes} extra eyes."
          @appearance = [@appearance - (extra_eyes), 1].max
          @initiative += (extra_eyes / 2)
          @character_notes << "Vision acuity increased by #{(extra_eyes / 2) * 5} percent by extra eyes."
        when 61
          physical_alteration = "Hair the thickness of string."
        when 62
          physical_alteration = "Facial order upside down: mouth on forehead, nose, then eyes."
          @appearance = [@appearance - (d(6) + d(6) + d(6) + d(6)), 1].max
        when 63
          physical_alteration = "Double-speed hair growth."
        when 64
          physical_alteration = "Eyes are on the sides of the mutant's head."
          @appearance = [@appearance - (d(4) + d(4)), 1].max
          @perception += (d(4) + d(4))
        when 65
          physical_alteration = "Huge toad-like eyes on top of mutant's head."
          @appearance = [@appearance - (d(4) + d(4)), 1].max
          @perception += (d(10) + d(10))
        when 66
          extra_finger_location = random_body_location(d(20))
          physical_alteration = "Extra finger on #{extra_finger_location}. Mutant suffers -#{d(3)} appearance if extra finger isn't concealed."
        when 67
          prehensile_tail_location = random_body_location(d(20))
          physical_alteration = "Prehensile tail on #{prehensile_tail_location}, 3m length. Can wield dagger or knife in combat."
          @agility += (d(4) + d(4))
          @movement_rate_base += 1
          if prehensile_tail_location == "head"
            @appearance = [@appearance - (d(6) + d(6)), 1].max
          else
            @appearance = [@appearance - d(6), 1].max
          end
        when 68
          physical_alteration = "Strong immune system: mutant gains 2 hazard checks vs. poison, radiation, disease, etc."
          @character_notes << "Due to strong immune system, 2 hazard checks vs. poison, radiation, disease, etc."
          @endurance_healing_rate += 4

        when 69
          physical_alteration = "Thick bones."
          @endurance += (d(6) + d(6))
        when 70
          physical_alteration = "Exceedingly flexible."
          @agility += (d(6) + d(6))
        when 71
          physical_alteration = "Slow metabolism - mutant requires 1/2 as much food as typical human."
        when 72
          physical_alteration = "Ventriloquist vocal chords - mutant can throw voice 5m."
        when 73
          physical_alteration = "Chameleon skin: can change flesh color to blend into surroundings as skill: conceal self or concealed movement as skill level 4 when near naked."
        when 74
          physical_alteration = "Elongated tongue: #{(14 + d(6) + d(6))} cm long."
        when 75
          physical_alteration = "Gorilla-like hair covers entire body."
          @appearance = [@appearance - (d(6) + d(6)), 1].max
        when 78
          physical_alteration = "Four legs, two sets of hips, legs work in unison."
          @movement_rate_base += (d(6) + 1)
          @endurance += (d(6) + d(6) + d(6))
          @appearance = [@appearance - (d(6) + d(6)), 1].max
        when 79
          physical_alteration = "Baggy skin on body and face."
          @appearance = [@appearance - (d(10) + d(10) + 6), 1].max
        when 80
          physical_alteration = "Fungal skin growth: white patches across mutant's body."
          @appearance = [@appearance - d(8), 1].max
        when 81
          physical_alteration = "Fins grow on mutant's back, shoulders and arms - excellent swimmer!"
          @character_notes << "Due to fins, mutant cannot wear combat or shell class relic armors. Unless fins are sawed off..."
          @dv -= 4
          @appearance = [@appearance - d(6), 1].max
          @movement_rate_swimming += d(6)
        when 82
          physical_alteration = "Awesome body - centerfold level."
          @appearance += (10 + d(10))
          @strength += (10 + d(10))
          @endurance += d(10)
          @agility += d(10)
          @accuracy += d(10)
        when 83
          physical_alteration = "Huge heart pumps blood more efficiently."
          @strength += (10 + d(10))
          @endurance += (10 + d(10))
          @movement_rate_base += 1
        when 84
          physical_alteration = "Dense skin: mutant's skin is thick and resistant to physical harm."
          @dv -= 5
          @endurance += (d(10) + d(10))
        when 85
          physical_alteration = "Carnivore: mutant cannot safely digest plant matter; however, carrion can be eaten safely."
        when 86
          physical_alteration = "Herbivore: mutant cannot digest meat or animal-derived foods. However, mutant can live on scrub weeds, dry grass, cactus, etc."
        when 87
          physical_alteration = "Bristly patches of thick hair cover #{(10 + d(10))} percent of mutant's body."
          @appearance = [@appearance - (d(6) + d(6)), 1].max
          @dv -= (d(3) + 1)
        when 88
          physical_alteration = "Patches of lizard scales cover #{(12 + d(12))} percent of mutant's body."
          @appearance = [@appearance - (d(8) + d(8)), 1].max
          @dv -= d(8)
        when 89
          physical_alteration = "Bone spikes on knees and elbows."
          @appearance = [@appearance - d(4), 1].max
          @dv -= 1
          @attacks << {:attack_mode => "Bone spikes", :SV => 3, :rate => 2, :range => 0, :damage => "d8", :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "78", :notes => ""}
          @character_notes << "Due to bone spikes, mutant cannot wear combat or shell class relic armors. Unless they are sawed off..."
        when 90
          physical_alteration = "Bone-studded fists: +3 dmg to punch attack."
        when 91
          physical_alteration = "Bone ridge down back."
          @appearance = [@appearance - d(4), 1].max
          @dv -= (6 + d(6))
        when 92
          physical_alteration = "Pig's nose."
          @appearance = [@appearance - (d(6) + d(6)), 1].max
          @character_notes << "Due to pig's nose, mutant has 50 percent enhanced olfactory sense."
        when 93
          physical_alteration = "Two nipples on each breast."
        when 94
          physical_alteration = "Four ears."
          @appearance = [@appearance - d(6), 1].max
          @initiative += 1
          @character_notes << "Due to additional ears, character has double the chance to hear anything."
        when 95
          physical_alteration = "Bone spines on back."
          @appearance = [@appearance - d(6), 1].max
          @dv -= (d(6) + d(6) + 9)
          @character_notes << "Due to bone spines, mutant cannot wear combat or shell class relic armors. Unless they're sawed off..."
        when 96
          physical_alteration = "Bone frill around base of skull."
          @appearance = [@appearance - (d(6) + d(6)), 1].max
          @dv -= (d(6) + d(6))
          @character_notes << "Due to bone frill, mutant cannot wear combat or shell class relic armors. Unless it's sawed off..."
          @attacks << {:attack_mode => "Bone frill slash", :SV => 4, :rate => 1, :range => 0, :damage => "d12 + 2", :ammo => "infinite", :skill_pts => 0, :skill_SV_bonus => 0, :skill_damage_bonus => 0, :ref => "78", :notes => ""}
        when 97
          physical_alteration = "Dense muscles and bones."
          @strength += d(6,3)
          @endurance += d(6,3)
        when 98
          physical_alteration = "Cat-like balance and grace."
          @agility += d(6,2)
          @accuracy += d(6,2)
          @appearance += d(4,2)
        when 99
          2.times do 
            physical_alterations_mutations(d(100))
          end 
        when 100
          physical_alteration = "Toughness."
          @strength += d(6,2)
          @endurance += d(6,2)
          2.times do 
            physical_alterations_mutations(d(100))
          end 
        end

        @minor_mutations << "Physical alteration: #{physical_alteration}"
      end

      physical_alterations_mutations(d(100))

    when 92..94
      @minor_mutations << "Pouch: water-tight abdominal pouch capable of concealing a relic handgun, 2 grenades, a sheathed knife, 1 days' food and water, tinderbox, or similar-sized objects."
    when 95..97
      def wakefulness(roll)
        case roll
        when 2
          "#{d(6)} hours"
        when 3..5
          "#{d(4)} hours"
        when 6..8
          "#{d(3)} hours"
        when 9..10
          "1 hour"
        when 11
          "#{d(20)} minutes"
        when 12
          "Mutant never sleeps"
        end
        sleep_needs = wakefulness((d(6) + d(6)))
        @minor_mutations << "Wakefulness: mutant requires less sleep - #{sleep_needs} nightly."
      end

    when 98..100 # Supposed to roll separate INT and WIL scores for each brain... haven't implemented that yet.
      def underdeveloped_limb(roll)
        case roll
        when 1
          @minor_mutations << "A handless arm grows from the shoulder. This limb could have an axe or sword lashed to it for an additional melee attack."
          @appearance = [@appearance - (d(6) + d(6)), 1].max
        when 2
          def extra_head_feature(roll)
            case roll
            when 1
              "only a mouth"
            when 2
              "reserve mind"
              # add reserve mind
            when 3
              "a single eye"
            when 4
              "a nose only"
            when 5
              "ears only"
            when 6
              "brain with one random mental mutation, TME1-59 p 59"
            end
          end

          @minor_mutations << "The beginnings of an extra head grows from the shoulders with #{extra_head_feature(d(6))}."
          @appearance = [@appearance - (d(6) + d(6) + 2), 1].max
        when 3
          @minor_mutations << "A third leg grows off the hip, ending at the knee."
          @appearance = [@appearance - (d(6) + d(6) + 2), 1].max
          @movement_rate_base -= 1
        when 4
          @minor_mutations << "#{d(4)} handless arms grow from the shoulders. Can have a melee weapon lashed to each for additional melee attacks."
        when 5
          def extra_torso_feature(roll)
            case roll
            when 1
              "female reproductive system"
            when 2
              "male reproductive system"
            when 3
              "additional heart and lungs"
              @endurance += (d(10) + d(10))
              @strength += (d(10) + d(10))
            when 4
              "digestive system"
            when 5
              "#{d(4)} reserve minds"
            when 6
              #not sure whether this will work...
              brain_extra_mutation = ghost_mutations_determination(d(100))
              "brain with 1 mental mutation: #{brain_extra_mutation}"
            end
          end

          @minor_mutations << "A large extra torso-like bulge grows from mutant's back, including #{extra_torso_feature(d(6))}."
          @character_weight += 20
          @appearance = [@appearance - (d(6) + d(6) + 3), 1].max
        when 6
          head_numbers = d(4)
          head_numbers.times do
            @minor_mutations << "Underdeveloped extra head number #{head_numbers} with #{extra_head_feature(d(6))}"
            head_numbers -= 1
          end
          @appearance = [@appearance - (d(6) + d(6) + 2), 1].max
        when 7
          def shrunken_arm_location(roll)
            case roll
            when 1
              "back"
            when 2
              "chest"
            when 3
              "side"
            when 4
              "shoulder"
            when 5
              "belly"
            when 6
              "hip"
            end
          end

          @minor_mutations << "A shrunken arm and tiny hand grow from mutant's #{shrunken_arm_location(d(6))}. Arm is 1/4 strength of others but can use a small weapon if character wishes."
          @appearance = [@appearance - d(6), 1].max
        when 8
          def single_eye_mutation(roll1, roll2) # p. 79
            case roll1
            when 1
              "back of head"
            when 2
              "shoulder"
            when 3
              "chest"
            when 4
              "forehead"
            when 5
              "back"
            when 6
              "belly"
            end

            case roll2
            when 1..66
              def single_eye_ability(roll3) # need to add in actual mutation attacks here...
              end
            end
            case roll3
            when 1
              "devastator pulse"
            when 2
              "electro magnetic pulse"
            when 3
              "beam eyes"
            when 4
              "electrical pulse"
            when 5
              "light burst"
            when 6
              "night vision"
            end
          end

          single_eye_ability(d(6))
          @minor_mutations << "A single eye winks from mutant's #{single_eye_mutation(d(6), d(100))}"

          # @minor_mutations << "Underdeveloped Limb" # I think this line is redundant...
        end
        underdeveloped_limb(d(8))
      end
    end
    ##### End Table TME-1-60 #####


    ##### Table TME-1-61, Flaw Mutations, Hub Rules p. 59 #####

    def flaw_mutations_determination(roll)
      case roll
      when 01..02
        "Abnormal Anxiety"
      when 03..04
        "Altered Digestive Tract"
      when 05..06
        "Baldness"
      when 07..17
        "Birth Defect"
      when 18..19
         "Blocked Sinuses"
      when 20..21
        "Chronic Acne"
      when 22..23
        "Chronic Dermatitis"
      when 24..25
        "Chronic Ingrown Hairs"
      when 26..27
       "Chronic Ulcers"
      when 28..29
        "Coronary Thrombosis"
      when 30..31
        "Degenerated Nervous System"
      when 32..33
        "Dizziness"
      when 34..35
        "Early Menopause (females only)"
      when 36..37
        "Excessive Lung Fluid"
      when 38..39
        "Exhaustion"
      when 40..41
         "Extensive Warts"
      when 42..43
        "Extreme Halitosis"
      when 44..45
         "Faulty Immune System"
      when 46
        "Flammable Tissues"
      when 47
        "Hemophilia"
      when 48..49
        "Hormone Disorder"
      when 50..51
        "Inadequate Nerve Endings"
      when 52
        "Increased Aging"
      when 53
        "Increased Flatulence"
      when 54..57
        "Intense Allergy"
      when 58..59
        "Male Menopause (males only)"
      when 60..61
        "Migraine Headaches"
      when 62..63
        "Osteoporosis"
      when 64..65
        "Permanent Rhinitis"
      when 66..67
        "Perpetual Hiccups"
      when 68..69
        "Pre-Senile Dementia"
      when 70..71
        "Psoriasis"
      when 72..73
        "Reactionary Scent"
      when 74
        "Repeat Paralysis"
      when 75
        "Sonic Intolerance"
      when 76..77
        "Sterility"
      when 78..79
        "Tapeworms"
      when 80..81
        "Tooth Decay"
      when 82..86
        "Toxic Susceptibility"
      when 87..88
        "Tranquilizer Agent"
      when 89..94
        "Visual Disorder"
      when 95..96
        "Voice Disorder"
      when 97..98
        "Weeping"
      when 99..00
        "Whistle Croup"
      end
    end

    # defining a master function to roll and import all the mutations doesn't work... ???
    # def determine_all_mutations
    #   @ghost_mutations_rolls.times do
    #     @ghost_mutations << ghost_mutations_determination(d(100))
    #   end

    #   @minor_mutations_rolls.times do
    #     minor_mutations_determination(d(100))
    #   end

    #   @flaw_mutations_rolls.times do
    #     flaw_mutations_determination(d(100))
    #   end

    #   @primary_mutations_rolls.times do
    #     prime_mutation_determination(d(1000))
    #   end
    # end

  end
  
end 

class Mutant < Character

  attr_accessor :ghost_mutations_rolls, :primary_mutations_rolls, :minor_mutations_rolls, :flaw_mutations_rolls, :ghost_mutations, :primary_mutations, :minor_mutations, :flaw_mutations

  include Mutant_determination_lookups

  def initialize
    super
    @ghost_mutations_rolls = 0
    @primary_mutations_rolls = 0
    @minor_mutations_rolls = 0
    @flaw_mutations_rolls = 0
    @ghost_mutations = []
    @primary_mutations = []
    @minor_mutations = []
    @flaw_mutations = []
  end

  def determine_all_mutations
    @ghost_mutations_rolls.times do
      @ghost_mutations << ghost_mutations_determination(d(100))
    end

    @minor_mutations_rolls.times do
      @minor_mutations << minor_mutations_determination(d(100))
    end

    @flaw_mutations_rolls.times do
      @flaw_mutations << flaw_mutations_determination(d(100))
    end

    while @primary_mutations_rolls > 0 do
      thisroll = d(1000)
      puts "Primary mutation roll: #{thisroll}"
      @primary_mutations << prime_mutation_determination(thisroll)
      puts "#{prime_mutation_determination(thisroll)} mutation gained!!"
    end
  end

end



  class Ghost_mutant < Mutant

    def starting_ghost_mutations(roll)
      # Table TME-1-16 Starting Ghost Mutations, Hub Rules p. 22
      case roll
      when 1
        1
      when 2..5
        2
      when 6..8
        3
      when 9
        4
      when 10
        d(4) + 4
      end
    end

    def initialize
      super
      @race = "Ghost Mutant"
      @ghost_mutations_rolls = starting_ghost_mutations(d(10))
      determine_all_mutations
    end

  end

  class Mutant_mild < Mutant
    include Mutant_determination_lookups
    def mild_mutant_flaw(roll)
      case roll
      when 1
        1
      when 2..4
        0
      end
    end

    # Table TME-1-17 Degree of Mutation, Hub Rules p. 23
    def initialize
      super
      @race = "Mutant, Mild"
      @primary_mutations_rolls = d(3)
      @minor_mutations_rolls = d(2)
      @flaw_mutations_rolls = mild_mutant_flaw(d(4))
      determine_all_mutations
    end

  end

  class Mutant_typical < Mutant
    include Mutant_determination_lookups
    # Table TME-1-17 Degree of Mutation, Hub Rules p. 23
    def typical_mutant_flaw(roll)
      case roll
      when 1..65
        1
      when 66..100
        0
      end
    end

    def initialize
      super
      @race = "Mutant, Typical"
      @primary_mutations_rolls = (d(3) + 2)
      @minor_mutations_rolls = (d(3) + 1)
      @flaw_mutations_rolls = typical_mutant_flaw(d(100))
      determine_all_mutations
    end

  end

  class Mutant_severe < Mutant
    # Table TME-1-17 Degree of Mutation, Hub Rules p. 23
      include Mutant_determination_lookups
    def initialize
      super
      @race = "Mutant, Severe"
      @primary_mutations_rolls = (d(4) + 3)
      @minor_mutations_rolls = (d(3) + 2)
      @flaw_mutations_rolls = d(2)
      determine_all_mutations
    end

  end

  class Mutant_freakish_horror < Mutant
      include Mutant_determination_lookups
    # Table TME-1-17 Degree of Mutation, Hub Rules p. 23
    def initialize
      super
      @race = "Mutant, Freakish Horror"
      @primary_mutations_rolls = (d(6) + 4)
      @minor_mutations_rolls = (d(4) + 3)
      @flaw_mutations_rolls = (d(2) + 1)
      determine_all_mutations
    end


  end 
