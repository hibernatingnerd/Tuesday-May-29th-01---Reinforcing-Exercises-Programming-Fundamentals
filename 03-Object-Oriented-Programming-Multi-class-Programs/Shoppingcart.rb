require "./Product.rb"
require "pry"
class Shoppingcart

  @@tax_rate = 1.15

  def initialize
    @cart = []
  end

  #instance methods

  def add_item(item)
    @cart << item
  end


# deletes all instances of an item unless uniquely named.
  def remove_item(item)
    @cart.delete(item)
  end

  def all
    @cart
  end

  def total
    sum = 0
    @cart.each {|total_temp|
    sum += total_temp.value}
    sum
  end

  def tax_total
    sum = 0
    @cart.each {|total_temp|
    sum += total_temp.value * @@tax_rate}
    sum.round(2)
  end


#class methods

end



bananas = Product.new("banana", 1.99)
apples = Product.new("apples", 0.99)
pears = Product.new("pears", 3.99)
bread = Product.new("bread", 2.99)
cart = Shoppingcart.new
binding.pry
