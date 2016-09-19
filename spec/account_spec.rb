require 'account'

describe Account do

  subject { described_class.new }

  describe '.initialize' do
    it 'creates the account with a balance of 0' do
      expect(subject.balance).to eq(0)
    end

    it 'creates a new statement' do
      expect(Statement).to receive(:new)
      Account.new
    end
  end

  describe '.deposit' do
    it 'allows user to make a deposit' do
      subject.deposit(500)
      expect(subject.balance).to eq(500)
    end

    it 'sends the action to the statement' do
      Time.stub(:now).and_return(Time.new(2016, 9, 19))
      expect(subject.statement).to receive(:add_action).with("19/09/2016", 500, nil, 500)
      subject.deposit(500)
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

    it 'sends the action to the statement' do
      allow(Time).to receive(:now).and_return(Time.new(2016, 9, 19))
      subject.deposit(500)
      expect(subject.statement).to receive(:add_action).with("19/09/2016", nil, 300, 200)
      subject.withdraw(300)
    end
  end

  describe '.print_statement' do
    it 'sends print message to statement' do
      expect(subject.statement).to receive(:print)
      subject.print_statement
    end
  end

end
