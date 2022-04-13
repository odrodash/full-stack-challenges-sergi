require_relative '../models/employee'
require_relative '../views/session_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionView.new
  end

  def sign_in
    username = @view.ask_for_username
    password = @view.ask_for_password
    employee = @employee_repository.find_by_username(username)
    if employee && employee.password == password
      @view.welcome(username)
      employee
    else
      @view.error
      print `clear`
      sign_in
    end
  end
end
