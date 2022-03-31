def burger(patty, sauce, topping)
  agregar = (block_given? ? yield(patty) : patty)
  ["bread", agregar, sauce, topping, "bread"]
end
