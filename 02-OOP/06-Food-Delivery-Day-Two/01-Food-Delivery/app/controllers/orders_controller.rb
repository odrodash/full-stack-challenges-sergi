require_relative '../models/order'
require_relative '../views/view_order'
require_relative '../views/view_meal'
require_relative '../views/view_customer'
require_relative '../views/session_view'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @view = ViewMeal.new
    @view_order = ViewOrder.new
    @customer_view = ViewCustomer.new
    @sessions_view = SessionView.new
  end

  def add
    meals = @meal_repository.all
    @view.display(meals)
    id_meal = @view_order.ask_for_id("meal")
    meal = @meal_repository.find(id_meal)

    customers = @customer_repository.all
    @customer_view.display(customers)
    id_customer = @view_order.ask_for_id("customer")
    customer = @customer_repository.find(id_customer)

    employees = @employee_repository.all_riders
    @sessions_view.display(employees)
    id_employee = @view_order.ask_for_id("employee")
    employee = @employee_repository.find(id_employee)

    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.create(order)
  end

  def list_undelivered_orders
    list = @order_repository.undelivered_orders
    @view_order.display(list)
  end

  def list_my_orders(employee)
    @view_order.display_list(employee)
  end

  def mark_as_delivered(employee)
    list_my_orders(employee)
    index = @view_order.ask_for_id("order")
    @order_repository.mark_as_order(index)
  end
end
