require "csv"
require_relative "recipe"
class Cookbook
  def initialize(csv_file_path)
    @csv_file = csv_file_path
    @recipes = []
    load
  end

  def all
    @recipes
  end

  def add_recipe(new_recipe)
    @recipes << new_recipe
    save
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    save
  end

  private

  def save
    CSV.open(@csv_file, "wb") do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end

  def load
    CSV.foreach(@csv_file) do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
  end
end
