

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


class Suitcase
  # this is a barebones class, a stub or placeholder, that lets us create suitcases to put in the cargohold defined next
end

class CargoHold
  include Stacklike
  def load_and_report(obj)
    print "Loading object: "
    puts obj.object_id

    add_to_stack(obj)  # this is a method from the Stacklike module
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
=end

class Person
  PEOPLE = []
  attr_reader :name, :hobbies, :friends
  def initialize(name)
    @name = name
    @hobbies = []
    @friends = []
    PEOPLE << self
  end
  def has_hobby(hobby)
    @hobbies << hobby
  end
  def has_friend(friend)
    @friends << friend
  end


  def self.method_missing(m, *args)
    method = m.to_s
    if method.start_with?("all_with_")
      attr = method[9..-1]   # takes the substring that lies within the 9th through last character positions
      if self.public_method_defined?(attr)
        PEOPLE.find_all do |person|
          person.send(attr).include?(args[0])
        end
      else
        raise ArgumentError, "Can't find #{attr}"
      end
    else
      puts "ERROR"
      super
    end
  end
end

j = Person.new("John")
p = Person.new("Paul")
g = Person.new("George")
r = Person.new("Ringo")
j.has_friend(p)
j.has_friend(g)
g.has_friend(p)
r.has_hobby("rings")

Person.all_with_friends(p).each do |person|
  puts "#{person.name} is friends with #{p.name}"
end
Person.all_with_hobbies("rings").each do |person|
  puts "#{person.name} is into rings"
end

