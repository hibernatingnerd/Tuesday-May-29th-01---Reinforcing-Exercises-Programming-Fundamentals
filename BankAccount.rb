class BankAccount

  @@interest_rate = 0.15

  @@accounts = []

  def initialize
    @balance = 0
  end

  # reader
  def balance
    @balance
  end

  # writer
  def balance=(value)
    @balance = value
  end

  def deposit(number)
    @balance += number
  end

  def withdraw(number)
    @balance -= number
  end

  def self.create
    temp_acct = self.new
    @@accounts << temp_acct
    return temp_acct
  end

  def self.total_funds
    total_funds = 0
    @@accounts.each {|acct| total_funds += acct.balance}
    return total_funds
  end

  def self.interest_time
    @@accounts.each {|acct| acct.balance *= (1 + @@interest_rate) }

  end

end
