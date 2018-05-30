class Book

# class variables
  @@on_shelf = []
  @@on_loan = []
  @@current_due_date = Time.new

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
    @due_date = nil
  end
#instance readers
  def due_date
    @due_date
  end

  def title
    @title
  end

  def author
    @author
  end

  def isbn
    @isbn
  end

#instance writers
  def due_date=(value)
    @due_date = value
  end

#instance methods


  def lent_out?
   @@on_loan.each { |book|
     if book == self #self referring to the instance calling it
       return true
     end}
   return false
  end

 def borrow
  if self.lent_out? == false
    @due_date = @@current_due_date
    @@on_shelf.delete(self)
    @@on_loan << self
    return true
  else
    return false
  end
  end

  def return_to_library
    if self.lent_out? == true
      @@on_shelf << self
      @@on_loan.delete(self)
      @dude_date = nil
      return true
    else
      return false
    end
  end

#class methods
def self.create(book_object)
  @@on_shelf << book_object
end

def self.available
  return @@on_shelf
end

def self.borrowed
  return @@on_loan
end

def self.browse
  return @@on_shelf.sample
end

def self.current_due_date
  @@current_due_date = Time.new
  return @@current_due_date
end

def self.overdue
      overdue_books = []
  @@on_loan.each do |book|
    if Time.now > book.due_date
      overdue_books << book
    end
  end
  return overdue_books
end

end

puts once = Book.new("Suck book", "no one", 123123412341)
puts twice = Book.new("Suck book two", "mikey", 3424234341)
puts third = Book.new("Suck book three", "one", 98243412341)
puts Book.create (once)
puts Book.create (twice)
puts Book.create (third)
puts "-------------------------------------------------"
puts Book.available
puts once.borrow
puts twice.lent_out?
puts twice.borrow
puts twice.lent_out?
puts Book.current_due_date
puts once.due_date
puts Book.borrowed
puts Book.available
puts once.return_to_library

puts Book.overdue
