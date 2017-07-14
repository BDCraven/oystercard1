class Journey
  MINIMUM_FARE = 1
  PENALTY = 6
  attr_reader :entry_station, :exit_station

  def initialize(entry_station)
    @entry_station = entry_station
  end

  def finish(exit_station)
    @exit_station = exit_station
  end

  def fare
    complete? ? MINIMUM_FARE : PENALTY
  end

  def complete?
    !!exit_station
  end
end
