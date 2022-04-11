require_relative "recipe"
require_relative "scraping"

class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      marked = recipe.done ? "[X]" : "[ ]"
      puts "#{index + 1}. #{marked} #{recipe.name} - #{recipe.description} - (#{recipe.rating}/5) - #{recipe.prep_time} mins"
    end
  end

  def ask_user_for(stuff)
    puts "#{stuff.capitalize}?"
    print "> "
    return gets.chomp
  end

  def ask_user_for_index
    puts "index?"
    return gets.chomp.to_i - 1
  end

  def ask_keyword_import
    puts "What ingredient would you like a recipe for?"
  end

  def puts_looking(keyword)
    puts "looking for #{keyword} recipes on the internet..."
  end

  def wich_importing
    puts "Which recipe would you like to import? (enter index)"
  end
end
