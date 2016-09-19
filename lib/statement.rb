class Statement
  attr_reader :history

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
      puts "#{action["Date"]} || #{action["Credit"]} || #{action["Debit"]} || #{action["Balance"]}"
    end
  end

end
