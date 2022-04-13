# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative "app/repositories/meal_repository"
require_relative "app/controllers/meals_controller"
require_relative "app/repositories/customer_repository"
require_relative "app/controllers/customers_controller"
require_relative "router"

csv_file = File.join("data/meals.csv")
csv_file_customer = File.join ("data/customers.csv")

meal_repository = MealRepository.new(csv_file)
customer_repository = CustomerRepository.new(csv_file_customer)

controller = MealsController.new(meal_repository)
controller_custom = CustomersController.new(customer_repository)

router = Router.new(controller, controller_custom)

router.run
