require_relative "station"

class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :entry_station, :exit_station, :journeys, :current_journey

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded." if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "You have insufficient funds." if balance < MINIMUM_FARE
    deduct(current_journey.fare) unless current_journey.nil? || current_journey.complete?
    @current_journey = Journey.new(station)
  end

  def touch_out(station)
    deduct(current_journey.fare) if current_journey.nil? || current_journey.complete?
    current_journey.finish(station)
    journeys << current_journey
  end

  def in_journey?
    !!current_journey
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
