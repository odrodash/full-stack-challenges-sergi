require_relative "restaurant"
puts "whats food the like eat?"
food = gets.chomp
puts "whats beverage the like drink?"
beverage = gets.chomp


eats = Restaurant.new(food, beverage)
eats.food_service
eats.beverage_service
