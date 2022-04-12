require "csv"
require_relative "../models/customer"

class CustomerRepository
  def initialize(csv_customer_file)
    @csv_customer_file = csv_customer_file
    @customers = []
    @next_c_id = 1
    load if File.exist?(@csv_customer_file)
  end

  def create(customer)
    customer.id = @next_c_id
    @customers << customer
    save
    @next_c_id += 1
  end

  def all
    @customers
  end

  def find(index)
    @customers.find do |customer|
      customer.id == index
    end
  end

  private

  def load
    @next_c_id = 0
    CSV.foreach(@csv_customer_file, headers: :first_row, header_converters: :symbol) do |row|
      @customers << Customer.new({id: row[:id].to_i, name: row[:name], address: row[:address]})
    end
    @next_c_id = @customers.empty? ? 1 : @customers.last.id + 1
  end

  def save
    CSV.open(@csv_customer_file, "wb") do |csv|
      csv << ["id", "name", "address"]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end
