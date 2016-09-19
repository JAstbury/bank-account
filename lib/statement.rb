class Statement
  attr_reader :history
  DATE_FORMAT = "%d/%m/%Y"

  def initialize
    @history = []
  end

  def add_action(date, credit, debit, balance)
    @history.unshift({ "Date" => date, "Credit" => credit,
                  "Debit" => debit, "Balance" => balance })
  end

  def print
    puts "date || credit || debit || balance"
    @history.each do |action|
      puts "#{action["Date"]} || #{print_amount(action["Credit"])} || #{print_amount(action["Debit"])} || #{print_amount(action["Balance"])}"
    end
  end

  private

  def print_amount(amount)
    '%.2f' % amount unless amount.nil?
  end

end
