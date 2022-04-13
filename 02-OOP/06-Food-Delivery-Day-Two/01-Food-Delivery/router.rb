# TODO: implement the router of your app.
class Router
  def initialize(controller, customer_controller,session_controller)
    @controller = controller
    @controller_custom = customer_controller
    @session_controller = session_controller
    @running    = true
    @employee = true
  end

  def run
    puts "Welcome to the Food Delivery!"
    puts "           --           "
    while @employee
      @employee = @session_controller.sign_in
      @running = true
      while @running
        if @employee.manager?
          display_tasks_manager
          action = gets.chomp.to_i
          print `clear`
          route_action_manager(action)
        elsif @employee.rider?
          display_tasks_rider
          action = gets.chomp.to_i
          print `clear`
          route_action_rider(action)
        end
      end
    end
  end

  private

  def route_action_manager(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.add
    when 3 then @controller_custom.list
    when 4 then @controller_custom.add
    when 5 then @controller_order.list_undelivered_orders
    when 6 then @controller_order.add
    when 7
      @running = false
    when 8
      @running = false
      @employee = false
    else
      puts "Please press 1, 2, 3, 4, 5, 6, 7 or 8"
    end
  end

  def display_tasks_manager
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all meals"
    puts "2 - Create a new meals"
    puts "3 - List all Customers"
    puts "4 - Create a new customers"
    puts "5 - List undelivered orders"
    puts "6 - Create a new orders"
    puts "7 - Log out"
    puts "8 - exit"
  end

  def route_action_rider(action)
    case action
    when 1 then @controller_order.mark_as_delivery
    when 2 then @controller_order.list_my_orders
    when 3
      @running = false
    when 4
      @running = false
      @employee = false
    else
      puts "Please press 1, 2, 3 or 4"
    end
  end

  def display_tasks_rider
    puts ""
    puts "What do you want to do next?"
    puts "1 - Mark delivery"
    puts "2 - List of all undelivered orders"
    puts "3 - Log out"
    puts "4 - exit"
  end
end
