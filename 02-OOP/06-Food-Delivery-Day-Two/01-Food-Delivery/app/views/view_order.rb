require_relative '../models/order'

class ViewOrder
  def initialize
    @mark = Order.new
  end

  def display(orders)
    orders.each do |order|
      marked = @mark.delivered? ? ["X"] : [" "]
      puts "#{order.id}- #{marked} -#{order.meal} - #{order.customer.name} - #{order.employee.username}"
    end
  end

  def ask_for_id(loquesea)
    puts "What is the index #{loquesea}?"
    return gets.chomp.to_i
  end

  def display_list(employees)
    puts "#{employees.id} - #{employees.username}"
  end

  def ask_for_index
    puts "what is your index for marked?"
    return gets.chomp.to_i - 1
  end
end
