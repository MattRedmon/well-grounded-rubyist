
=begin

This first section creates setter and getter methods the long way, without using
Ruby's built in getter/setter attr_ methods

class Ticket
  def initialize(venue, date, price)
    @venue = venue
    @date = date
    @price = price
  end
# the next three defs are getter methods
  def venue  # these read back the venue and date info
    @venue   # since the variable is the last and only expression of the method, the variable is what is returned
  end
  def date
    @date
  end
  def price
    @price
  end

# this def and its alternate below it are setter methods
#  def set_price(amount)
#    @price = amount
#  end

# below is alternate code to the above, we define a method that ends with an equal sign
# price= below does exactly what set_price did above
# gives the familiar "assigning a value to something" feeling
  def price=(amount)
    @price = amount
  end
end

th = Ticket.new("Town Hall", "11/12/13", 50.99)
cc = Ticket.new("Convention Center", "12/13/14", 75.66)
puts "We've created two tickets . . . "
puts "The first is for a #{th.venue} event on #{th.date} costing $#{th.price}"
puts "The second is for an event that costs $#{cc.price} on #{cc.date} at the #{cc.venue}"

# Ruby gives some syntatic sugar for calling setter methods
# th.price=(105.99)
# above is the original and below is the sugared version that works exactly as above
th.price = 105.99
# cc.price=(125.66)
cc.price = 125.66
# Ruby ignores the space between price and = and sees price= as method call to object th or cc
# the receiver is th/cc, the method is price= and the single argument is price (either 105.99 or 125.66) in our example


puts "The new price for the ticket at #{th.venue} is $#{th.price}"
puts "The new price for the ticket at #{cc.venue} is $#{cc.price}"
=end

# This new code uses the attr_reader/writer methods instead of doing it the long way like above

class Ticket
  attr_reader :venue, :date, :price
  attr_writer :price
  # below is alternate code for 2 lines above
  # attr_reader :venue, :date
  # attr_accessor :price
  # attr_accessor takes place of reader and writer
  # now price is in only one location as opposed to 2 in the original code
  def initialize(venue, date, price)
    @venue = venue
    @date = date
    @price = price
  end
end

th = Ticket.new("Town Hall", "11/12/13", 50.99)
cc = Ticket.new("Convention Center", "12/13/14", 75.66)
puts "We've created two tickets . . . "
puts "The first is for a #{th.venue} event on #{th.date} costing $#{th.price}"
puts "The second is for an event that costs $#{cc.price} on #{cc.date} at the #{cc.venue}"

th.price = 105.99
cc.price = 125.66

puts "The new price for the ticket at #{th.venue} is $#{th.price}"
puts "The new price for the ticket at #{cc.venue} is $#{cc.price}"