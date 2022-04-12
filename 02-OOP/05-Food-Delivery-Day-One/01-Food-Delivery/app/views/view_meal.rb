require_relative "../models/meal"

class ViewMeal
  def display(meals)
    meals.each do |meal|
      puts "#{meal.id}.- meal: #{meal.name}, price: #{meal.price}bs"
    end
  end

  def ask_for_user_name
    puts "What name the meals for add?"
    return gets.chomp
  end

  def ask_for_user_price
    puts "what is the price meals for add?"
    return gets.chomp.to_i
  end
end
