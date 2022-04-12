require_relative "../models/customer"

class ViewCustomer
  def display(customers)
    customers.each do |customer|
      puts "#{customer.id}.- custom: #{customer.name}, address: #{customer.address}"
    end
  end

  def ask_for_custom_name
    puts "what is your custom name"
    return gets.chomp
  end

  def ask_for_custom_address
    puts "what is your custom address"
    return gets.chomp
  end
end
