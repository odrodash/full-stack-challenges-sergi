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

  def mark_as_done(index)
    @recipes[index].mark_as_done!
    save
  end

  private

  def save
    CSV.open(@csv_file, "wb") do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating, recipe.done, recipe.prep_time]
      end
    end
  end

  def load
    CSV.foreach(@csv_file) do |row|
      done = row[3] == "true"
      @recipes << Recipe.new(row[0], row[1], row[2].to_i, done, row[4].to_i)
    end
  end
end
