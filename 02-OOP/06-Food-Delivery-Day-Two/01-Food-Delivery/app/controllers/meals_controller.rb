require_relative "../models/meal"
require_relative "../views/view_meal"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = ViewMeal.new
  end

  def add
    name = @view.ask_for_user_name
    price = @view.ask_for_user_price
    meal = Meal.new(name: name, price: price)
    @meal_repository.create(meal)
    display_list
  end

  def list
    display_list
  end

  private

  def display_list
    meals = @meal_repository.all
    @view.display(meals)
  end
end
