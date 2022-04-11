require_relative "recipe"
require_relative "view"
require_relative "scraping"
require "open-uri"
require "nokogiri"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_recipes
  end

  def mark_recipe_as_done
    display_recipes
    i = @view.ask_user_for_index
    @cookbook.mark_as_done(i)
  end

  def create
    name = @view.ask_user_for("name")
    description = @view.ask_user_for("description")
    rating = @view.ask_user_for("rating").to_f
    prep_time = @view.ask_user_for("preparation time").to_i
    recipe = Recipe.new(name, description, rating, false, prep_time)
    @cookbook.add_recipe(recipe)
    display_recipes
  end

  def import
    @view.ask_keyword_import
    keyword = @view.ask_user_for("ingredient")
    @view.puts_looking(keyword)
    scrapper = ScrapeAllrecipesService.new(keyword)
    @web_recipes = scrapper.call
    @view.display(@web_recipes)
    @view.wich_importing
    index = @view.ask_user_for_index
    @cookbook.add_recipe(@web_recipes[index])
  end


  def destroy
    recipes = @cookbook.all
    @view.display(recipes)
    index = @view.ask_user_for_index
    @cookbook.remove_recipe(index)
  end

private

  def display_recipes
    recipes = @cookbook.all
    @view.display(recipes)
  end
end
