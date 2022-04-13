require_relative "../models/customer"
require_relative "../views/view_customer"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = ViewCustomer.new
  end

  def add
    name = @view.ask_for_custom_name
    address = @view.ask_for_custom_address
    customer = Customer.new(name: name, address: address)
    @customer_repository.create(customer)
    display_list
  end

  def list
    display_list
  end

  private

  def display_list
    list = @customer_repository.all
    @view.display(list)
  end
end
