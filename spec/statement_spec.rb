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

end
