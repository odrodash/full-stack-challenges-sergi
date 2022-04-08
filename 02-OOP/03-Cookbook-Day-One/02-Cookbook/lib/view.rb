require_relative "recipe"
class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name} - #{recipe.description}"
    end
  end

  def ask_name_recipe
    puts "name recipe"
    gets.chomp
  end

  def ask_description_recipe
    puts "description recipe"
    gets.chomp
  end

  def ask_for_index
    puts "index?"
    return gets.chomp.to_i - 1
  end
end
