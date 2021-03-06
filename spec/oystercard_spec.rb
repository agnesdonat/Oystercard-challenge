require 'oystercard'
describe Oystercard do

  describe '#balance' do

    it {is_expected.to respond_to :balance}

    it 'has a balance eq to 0' do
      expect(subject.balance).to eq 0
    end

  end

  describe '#top_up' do

    it 'increase the balance of the card' do
      expect(subject).to respond_to(:top_up).with(1).argument
    end

    it 'returns the balance from top_up' do
      expect{subject.top_up 1}.to change{ subject.balance}.by 1
    end

    it 'raises an error message if new balance > 90 pounds' do
      expect {subject.top_up(subject.limit + 1)}.to raise_error 'Sorry the new balance would exceed the limit!'
    end

  end

end
