require "csv"
require_relative "../models/meal"

class MealRepository
  def initialize(csv_meal_file)
    @meals_csv_file = csv_meal_file
    @meals = []
    @next_id = 1
    load if File.exist?(@meals_csv_file)
  end

  def create(meal)
    meal.id = @next_id
    @meals << meal
    save_csv
    @next_id += 1
  end

  def all
    return @meals
  end

  def find(index)
    @meals.find do |meal|
      meal.id == index
    end
  end


  def load
    @next_id = 0
    CSV.foreach(@meals_csv_file, headers: :first_row, header_converters: :symbol) do |row|
      @meals << Meal.new({id: row[:id].to_i, name: row[:name], price: row[:price].to_i})
    end
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end

  def save_csv
    CSV.open(@meals_csv_file, 'wb') do |csv|
      csv << ["id", "name", "price"]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end
