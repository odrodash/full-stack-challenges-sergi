require_relative '../models/employee'
require 'csv'

class EmployeeRepository
  def initialize(csv_file)
    @csv_employee_file = csv_file
    @employees = []
    @next_id = 1
    load if File.exist?(@csv_employee_file)
  end

  def all_riders
    riders = @employees.select do |employee|
      employee.role == "rider"
    end
    return riders
  end

  def find(id)
    @employees.find do |employee|
      employee.id == id
    end
  end

  def find_by_username(username)
    @employees.find do |employee|
      employee.username == username
    end
  end

  private

  def save_csv
    CSV.open(@csv_employee_file, 'wb') do |csv|
      csv << ["id", "username", "password", "role"]
      @employees.each do |employee|
        csv << [employee.id, employee.username, employee.password, employee.role]
      end
    end
  end

  def load
    next_id = 0
    CSV.foreach(@csv_employee_file, headers: :first_row, header_converters: :symbol) do |row|
      @employees << Employee.new({id: row[:id].to_i, username: row[:username], password: row[:password], role: row[:role]})
    end
    next_id = @employees.empty? ? 1 : @employees.last.id + 1
  end
end
 repo = EmployeeRepository.new("../data/employees.csv")
 p repo.all_riders
