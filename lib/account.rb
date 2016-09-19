require_relative 'statement'

class Account
  attr_reader :balance, :statement

  def initialize
    @balance = 0
    @statement = Statement.new
  end

  def deposit(amount)
    @balance += amount
    @statement.add_action(date, amount, nil, @balance)
  end

  def withdraw(amount)
    fail 'Not enough funds' if amount > @balance
    @balance -= amount
    @statement.add_action(date, nil, amount, @balance)
  end

  def print_statement
    @statement.print
  end

  private

  def date
    Time.now.strftime("%d/%m/%Y")
  end

end
