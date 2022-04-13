class Meal
  attr_accessor :id
  attr_reader :name, :price
  def initialize(attributes = {})
    @id = attributes[:id] || 1
    @name = attributes[:name]
    @price = attributes[:price]
  end
end
