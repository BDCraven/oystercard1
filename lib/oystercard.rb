require_relative "station"

class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_FAIR = 1

  attr_reader :balance, :entry_station, :exit_station, :journeys

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded." if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "You have insufficient funds." if balance < MINIMUM_FAIR
    @journey = {:entry_station => station}
  end

  def touch_out(station)
    deduct(MINIMUM_FAIR)
    @journey[:exit_station] = station
    @journeys << @journey
  end

  def in_journey?
    !!@journey
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
