class Order
  attr_accessor :id, :meal, :employee, :customer
  attr_reader :delivered
  def initialize(attributes = {})
    @id = attributes[:id] || 1
    @delivered = attributes[:delivered] || false
    @customer = attributes[:customer]
    @employee = attributes[:employee]
    @meal = attributes[:meal]
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end
