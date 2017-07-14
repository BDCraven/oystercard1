require 'oystercard'

describe Oystercard do

  subject(:card) { described_class.new }
  let(:station){double :station}
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  # let(:journey){ {entry_station: entry_station, exit_station: exit_station} }

  describe 'Oystercard has initial balance' do
    it 'has a balance of zero' do
      expect(card.balance).to eq(0)
    end
  end

  describe 'Oystercard stores journeys' do
    it 'has an empty list of journeys by default' do
      expect(card.journeys).to be_empty
    end
  end

  describe '#top_up' do
    it 'can top up the balance' do
      expect { card.top_up(Oystercard::MINIMUM_FARE) }.to change { card.balance }.by(Oystercard::MINIMUM_FARE)
    end

    it 'raises an error if the maximum balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      card.top_up(maximum_balance)
      expect { card.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded."
    end
  end

  describe '#touch_in' do

    it 'raises an error if oystercard has insufficient funds' do
      expect { card.touch_in(entry_station) }.to raise_error "You have insufficient funds."
    end

    it 'deducts a penalty if journey is not complete' do
      card.top_up(Oystercard::MAXIMUM_BALANCE)
      card.touch_in(entry_station)
      expect {card.touch_in(entry_station) }.to change { card.balance }.by(-6)
    end

    #describe '#journey' do

      #it 'contains information about zones' do
      #  card.top_up(4)
      #  card.touch_in(station)
      #  expect(card.journey).to eq one_way_journey
      #end
    #end

    context 'in journey' do

      before do
        card.top_up(Oystercard::MAXIMUM_BALANCE)
        card.touch_in(entry_station)
      end

      it 'stores something (hopefully, a journey)' do

        card.touch_out(exit_station)
        expect(card.journeys).not_to be_empty
      end

      it 'knows it is in journey' do
        expect(card).to be_in_journey
      end

    end
  end

  describe '#touch_out' do

    before do
      card.top_up(Oystercard::MINIMUM_FARE)
      card.touch_in(entry_station)
    end

    it 'deducts minimum fair from balance on touch out' do
      expect { card.touch_out(exit_station) }.to change { card.balance }.by(-Oystercard::MINIMUM_FARE)
    end

    it 'checks if current_journey is complete' do
      card.touch_out(exit_station)
      expect{ card.touch_out(exit_station) }.to change { card.balance }.by(-Journey::PENALTY)
    end
  end

end
