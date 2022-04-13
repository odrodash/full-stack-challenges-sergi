class Customer
  attr_accessor :id
  attr_reader :name, :address
  def initialize(attributes = {})
    @id = attributes[:id] || 1
    @name = attributes[:name]
    @address = attributes[:address]
  end
end
