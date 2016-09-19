require_relative 'statement'

class Account
  attr_reader :balance, :statement
  DATE_FORMAT = "%d/%m/%Y"

  def initialize
    @balance = 0
    @statement = Statement.new
  end

  def deposit(amount)
    @balance += amount
    add_to_statement(amount, nil)
  end

  def withdraw(amount)
    fail 'Not enough funds' if amount > @balance
    @balance -= amount
    add_to_statement(nil, amount)
  end

  def print_statement
    @statement.print
  end

  private

  def date
    Time.now.strftime(DATE_FORMAT)
  end

  def add_to_statement(credit, debit)
    @statement.add_action(date, credit, debit, @balance)
  end

end
