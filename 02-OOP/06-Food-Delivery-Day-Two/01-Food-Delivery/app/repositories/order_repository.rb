require 'csv'
require_relative '../models/order'

class OrderRepository
  def initialize(orders_csv_path, meal_repository, customer_repository, employee_repository)
    @csv_order_file = orders_csv_path
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders = []
    load if File.exist?(@csv_order_file)
  end

  def create(order)
    next_id = @orders.empty? ? 1 : @orders.last.id + 1
    order.id = next_id
    @orders << order
    save_csv
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered?}
  end

  def mark_as_order(index)
    @orders[index].deliver!
    save_csv
  end
  private

  def save_csv
    CSV.open(@csv_order_file, 'wb') do |csv|
      csv << ["id", "delivered", "meal_id", "customer_id", "employee_id"]
      @orders.each do |order|
        csv << [order.id, order.delivered, order.meal.id, order.customer.id, order.employee.id]
      end
    end
  end

  def load
    CSV.foreach(@csv_order_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:delivered] = row[:delivered] == "true"
      row[:id] = row[:id].to_i
      new_order = Order.new(row)
      meal = @meal_repository.find(row[:meal_id].to_i)
      new_order.meal = meal
      customer = @customer_repository.find(row[:customer_id].to_i)
      new_order.customer = customer
      employee = @employee_repository.find(row[:employee_id].to_i)
      new_order.employee = employee
      @orders << new_order
    end
  end
end
