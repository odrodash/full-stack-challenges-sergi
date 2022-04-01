DISHES_CALORIES = {
  "Hamburger" => 250,
  "Cheese Burger" => 300,
  "Big Mac" => 540,
  "McChicken" => 350,
  "French Fries" => 230,
  "Salad" => 15,
  "Coca Cola" => 150,
  "Sprite" => 150
}

def poor_calories_counter(burger, side, beverage)
  DISHES_CALORIES[burger] + DISHES_CALORIES[side] + DISHES_CALORIES[beverage]
end

COMIDA = {
  "Happy Meal" => ["Cheese Burger", "French Fries", "Coca Cola"],
  "Best Of Big Mac" => ["Big Mac", "French Fries", "Coca Cola"],
  "Best Of McChicken" => ["McChicken", "Salad", "Sprite"]
}

def calories_counter(orders)
  # TODO: return number of calories for a less constrained order
  sum_calories = orders.map do |mean|
    if COMIDA.key?(mean)
      poor_calories_counter(COMIDA[mean][0], COMIDA[mean][1], COMIDA[mean][2])
    else
      DISHES_CALORIES[mean]
    end
  end
  return sum_calories.sum
end
