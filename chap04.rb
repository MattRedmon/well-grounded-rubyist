

module Stacklike
  def stack
    @stack ||= []
  end
  def add_to_stack(obj)
    stack.push(obj)
  end
  def take_from_stack
    stack.pop
  end
end

=begin
class Stack
  include Stacklike
end

s = Stack.new
s.add_to_stack("item one")
s.add_to_stack("item two")
s.add_to_stack("item three")
puts "Objects currently on the stack: "
puts s.stack

taken = s.take_from_stack
puts "Removed this object: "
puts taken

puts "Now on the stack: "
puts s.stack
=end

class Suitcase
end

class CargoHold
  include Stacklike
  def load_and_report(obj)
    print "Loading object: "
    puts obj.object_id

    add_to_stack(obj)
  end
  def unload         # we use the take_from_stack method from Stacklike but wrap it in a new method with a better name
    take_from_stack  # this is the method from Stacklike module, wrapped in different method name
  end                # but it will still have the same functionality as it does in Stacklike
end

# you can wrap methods from module in new methods with names that better suit the new domain
# in our case we used the take_from_stack method from Stacklike and wrap it in a new method named unload
# which better matches what we are trying to describe in the current domain
# we are unloading luggage from a cargohold, which is really just a stack, but the unload
# is more descriptive of what we are doing.


ch = CargoHold.new
sc1 = Suitcase.new
sc2 = Suitcase.new
sc3 = Suitcase.new
ch.load_and_report(sc1)
ch.load_and_report(sc2)
ch.load_and_report(sc3)
first_unloaded = ch.unload
print "The first suitcase off the plane is : "
puts first_unloaded.object_id

