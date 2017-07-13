require 'journey'

describe Journey do
  let(:entry_station) { :entry_station }
  let(:exit_station) { :exit_station }
  subject (:journey) { described_class.new(entry_station) }

  it 'should store the entry station' do
    expect(journey.entry_station).to be entry_station
  end

  it 'should store the exit station' do
    journey.finish(exit_station)
    expect(journey.exit_station).to be exit_station
  end

  describe '#fare' do

    it 'calculates the fare of a journey' do
      journey.finish(exit_station)
      expect(journey.fare).to eq 1
    end
  end

  describe '#complete?' do

    it 'should know if a journey is complete' do
      journey.finish(exit_station)
      expect(journey).to be_complete
    end

    it 'should know if a journey is not complete' do
      expect(journey).not_to be_complete
    end
  end


end
