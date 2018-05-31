
class Vampire

# class variables
  @@coven = []

#instance methods
  def initialize (name, age)
    @name = name
    @age = age
    @drank_blood_today = false
    @in_coffin = false
  end

  def in_coffin
    @in_coffin
  end
  def in_coffin=(val)
    @in_coffin = (val)
  end

  def drank_blood_today
    @drank_blood_today
  end
  def drank_blood_today=(val)
    @drank_blood_today = (val)
  end

  def drink_blood
    @drank_blood_today = true
  end

  def go_home
    @in_coffin = true
  end
    # class methods

  def self.sunrise
    @deletethese = []
    @@coven.each do |vamp|
      if !vamp.drank_blood_today || !vamp.in_coffin
        @deletethese << vamp
      end
    end

    @deletethese.each do |vamp|
      @@coven.delete(vamp)
    end
    @@coven
  end

  def self.sunset
    @@coven.each do |vamp|
      puts "++"
      @drank_blood_today = false
      @in_coffin = false
    end
  end

  def self.all
    @@coven
  end

  def self.create
    temp = self.new("Vampire", rand(20..1000))
    @@coven << temp
    temp
  end
end

puts Vampire.create
puts Vampire.create
puts Vampire.create
puts Vampire.all
puts Vampire.sunrise
puts "ff"
puts Vampire.all
