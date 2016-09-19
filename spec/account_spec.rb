require 'account'

describe Account do

  subject { described_class.new }

  describe '.initialize' do
    it 'creates the account with a balance of 0' do
      expect(subject.balance).to eq(0)
    end
  end

end
