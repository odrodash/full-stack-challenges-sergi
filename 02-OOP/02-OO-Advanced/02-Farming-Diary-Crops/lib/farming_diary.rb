# DO NOT remove the two lines below, needed for display purposes
require_relative "../spec/helper/board"

require_relative "corn"
require_relative "rice"


puts "\n\n📝 Day One: Corn"
# 1. Instantiate a corn crop
day_one = Corn.new
# 2. Water the corn crop
day_one.water!
# 3. Replace 'TODO' with the value of `grains` for your crop
puts "The corn crop produced #{@grains} grains"
# 4. Replace 'TODO' with the state of the crop ('ripe' or 'not ripe')
puts "The corn crop is #{day_one.ripe?}"



puts "\n\n📝 Day Two: Rice"
# 1. Instantiate a rice crop
  day_two = Rice.new
# 2. Water the rice crop
  day_two.water!
# 3. Transplant the rice crop
  day_two.transplant!
# 4. Replace 'TODO' with the value of `grains` for your crop
puts "The rice crop produced #{@grains} grains"
# 5. Replace 'TODO' with the state of the crop ('ripe' or 'not ripe')
puts "The rice crop is #{day_two.ripe?}"


# DO NOT remove the two lines below, needed for display purposes
Board.new.display
