class Statement
  attr_reader :history

  def initialize
    @history = []
  end

  def add_action(date, credit, debit, balance)
    @history << { "Date" => date, "Credit" => credit,
                  "Debit" => debit, "Balance" => balance }
  end

end
