class Zombie

  # class variables
  @@horde = [] #empty array will house zombies
  @@plague_level = 10 #determine zombie spawn
  @@max_spd = 5 #max value for speed. Never changes
  @@max_str = 8 #max str value. static.
  @@default_spd = 1 #Doesn't change
  @@default_str = 3

  # an instance method initialize
  def initialize(z_spd, z_str)
    if z_spd > @@max_spd
      @spd = @default_spd
    else
      @spd = z_spd
    end
    if z_str > @@default_str
      @str = @@max_str
    else
      @str = z_str
    end
  end
  # an instance method encounter
  def encounter
    if self.outrun_zombie?
      return "You escape!"
    elsif self.survive_attack?
      return "You kill the zombie!"
    else
      return "You are one of the shuffling horde now."
    end
  end
  # an instance method outrun_zombie?
  def outrun_zombie?
    random = rand(1..@@max_spd)
    if random > @spd
      return true
    else
      @@horde << self.class.new(@@max_spd, @@max_str)
      return false
    end
  end
  # an instance method survive_attack?
  def survive_attack?
    random = rand(1..@@max_str)
    if random > @str
      return true
    else
      return false
    end
  end
  # a class method all
  def self.all
    @@horde
  end
  # a class method new_day
  def self.new_day
    self.some_die_off
    self.spawn
    self.increase_plague_level
  end
  # a class method some_die_off

def self.some_die_off
  random = rand(0..10)
  random.times {
  @@horde.delete_at(0)}
end
  # a class method spawn. Generate new_zombie value with the value of @@plague
  #randomized. iteration .times, shovel the self.new instances into the array.
def self.spawn
  new_zombie = rand(@@plague_level)
  new_zombie.times {
    @@horde << self.new(@@max_spd, @@max_str)}
end

# @@horde << zombie
# a class method calling on @@plague level increase_plague_level
def self.increase_plague_level
  @@plague_level += rand(0..2)
  return @@plague_level
end

end
puts zombie = Zombie.new(2, 2)
puts Zombie.all
puts Zombie.spawn
puts Zombie.all
puts Zombie.increase_plague_level
puts Zombie.increase_plague_level
puts Zombie.increase_plague_level
puts Zombie.some_die_off
puts zombie1 = Zombie.new(3, 3)
puts zombie1.encounter
puts Zombie.new_day
