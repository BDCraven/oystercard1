require './lib/oystercard'

# oystercard = Oystercard.new
# station1 = Station.new("Kings Cross", "Zone 1")
# station2 = Station.new("Wimbledon", "Zone 6")
# oystercard.top_up(10)
#oystercard.touch_in(station1)
#p oystercard.touch_in(station2)
# => -6
#p oystercard.balance
# => 4

#oystercard.touch_in(station1)
#oystercard.touch_out(station2)
#p oystercard.balance
# => 9

# oystercard.touch_in(station1)
# p oystercard.journey_complete?
# # => false
# oystercard.touch(station2)
# p oystercard.journey_complete?
# => true

# oystercard.journeys
# => nil
# p oystercard.touch_in(station1)
# p oystercard.journeys
# p oystercard.touch_out(station2)
# p oystercard.journeys
#{:station1 => station2}
# => [entry_station: station1, exit_station: station2]

#p oystercard
#oystercard.balance
#p oystercard
#oystercard.top_up(20)
#p oystercard
#oystercard.touch_in
#p oystercard
#oystercard.touch_out
#p oystercard
