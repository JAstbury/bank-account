require 'account'

describe Account do

  subject { described_class.new }

  describe '.initialize' do
    it 'creates the account with a balance of 0' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '.deposit' do
    it 'allows user to make a deposit' do
      subject.deposit(500)
      expect(subject.balance).to eq(500)
    end
  end

  describe '.withdraw' do
    it 'allows user to make a withdrawal' do
      subject.deposit(500)
      subject.withdraw(500)
      expect(subject.balance).to eq(0)
    end

    it 'does not allow user to withdraw more than the balance' do
      subject.deposit(500)
      expect { subject.withdraw(600) }.to raise_error "Not enough funds"
    end
  end

end
