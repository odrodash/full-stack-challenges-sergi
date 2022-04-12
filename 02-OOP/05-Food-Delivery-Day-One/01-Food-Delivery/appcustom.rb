require_relative "app/repositories/customer_repository"
require_relative "app/controllers/customers_controller"
require_relative "routercustom"

csv_file = File.join(__dir__, "data/customers.csv")
custom_repository = CustomerRepository.new(csv_file)
controller = CustomersController.new(custom_repository)

router = Router.new(controller)

router.run
