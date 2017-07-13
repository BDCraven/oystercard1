require 'station'

describe Station do
  subject(:station) { described_class.new("Kings Cross", "Zone 1") }

  it 'has a station name' do
    expect(station.name).to eq "Kings Cross"
  end

  it 'has a station zone' do
    expect(station.zone).to eq "Zone 1"
  end

end
