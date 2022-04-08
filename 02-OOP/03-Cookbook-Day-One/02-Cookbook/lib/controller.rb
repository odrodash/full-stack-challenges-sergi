require_relative "recipe"
require_relative "view"
class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end
  def list
    recipes = @cookbook.all
    @view.display(recipes)
  end

  def create
    new_name = @view.ask_name_recipe
    new_description = @view.ask_description_recipe
    new_recipe = Recipe.new(new_name, new_description)
    @cookbook.add_recipe(new_recipe)
  end

  def destroy
    recipes = @cookbook.all
    @view.display(recipes)
    index = @view.ask_for_index
    @cookbook.remove_recipe(index)
  end
end
