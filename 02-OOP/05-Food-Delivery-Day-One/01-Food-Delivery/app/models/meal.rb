class Meal
  attr_accessor :id
  attr_reader :name, :price
  def initialize(attributes = {})
    @id = attributes[:id] || 1
    @name = attributes[:name]
    @price = attributes[:price]
  end
end

platos = Meal.new(name: "majadito", price: 10)
p platos
puts "------------"
p platos.name
p platos.price
p platos.id
