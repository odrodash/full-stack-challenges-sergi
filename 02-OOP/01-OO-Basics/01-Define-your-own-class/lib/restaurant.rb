class Restaurant
  def initialize(food, beverage)
    @food = food.downcase
    @beverage = beverage.downcase
  end

  def food_service
    if @food == "majadito"
      return puts "its food select is: #{@food}"
    else
      return puts "its food select is: #{@food}"
    end
  end

  def beverage_service
    if @beverage == "coca cola"
      return puts "its beverage select is: #{@beverage}"
    else
      return puts "its beverage select is: #{@beverage}"
    end
  end
end
