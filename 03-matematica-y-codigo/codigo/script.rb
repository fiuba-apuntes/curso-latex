# My first Ruby program
 
class HelloWorld
   def initialize(name)
      @name = name.capitalize
   end
   def sayHello
      puts "Hello #{@name}!"
   end
end

hello = HelloWorld.new("World")
hello.sayHello
