# TODO: implement the router of your app.
class Router
  def initialize(controller, customer_controller)
    @controller = controller
    @controller_custom = customer_controller
    @running    = true
  end

  def run
    puts "Welcome to the Food Delivery!"
    puts "           --           "

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.add
    when 3 then @controller_custom.list
    when 4 then @controller_custom.add
    when 5 then stop
    else
      puts "Please press 1, 2, 3, 4 or 5"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all meals"
    puts "2 - Create a new meals"
    puts "3 - List all Customers"
    puts "4 - Create a new customers"
    puts "5 - exit"
  end
end
