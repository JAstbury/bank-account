require 'statement'

describe Statement do

  subject { described_class.new }

  describe '.initialize' do
    it 'creates an empty history' do
      expect(subject.history). to eq([])
    end
  end

  describe '.add_action' do
    it 'adds an action to the history' do
      subject.add_action("19/05/1992", 500, nil, 500)
      expect(subject.history). to eq([{"Date" => "19/05/1992", "Credit" => 500,
                                        "Debit" => nil, "Balance" => 500}])
    end
  end

  describe '.print' do

    it 'prints the history of the account' do
      subject.add_action("14/09/2016", 500, nil, 500)
      subject.add_action("15/09/2016", nil, 300, 200)
      expect(STDOUT).to receive(:puts).with("date || credit || debit || balance")
      expect(STDOUT).to receive(:puts).with("14/09/2016 || 500.00 ||  || 500.00")
      expect(STDOUT).to receive(:puts).with("15/09/2016 ||  || 300.00 || 200.00")
      subject.print
    end
  end

end
