class Journey
  MINIMUM_FARE = 1
  attr_reader :entry_station, :exit_station

  def initialize(entry_station)
    @entry_station = entry_station
  end

  def finish(exit_station)
    @exit_station = exit_station
  end

  def fare
    MINIMUM_FARE
  end

  def complete?
    !!exit_station
  end

end
