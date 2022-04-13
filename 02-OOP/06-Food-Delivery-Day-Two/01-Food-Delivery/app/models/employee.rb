class Employee
  attr_accessor :id
  attr_reader :username, :password, :role
  def initialize(attributes = {})
    @id = attributes[:id] || 1
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
  end

  def manager?
    if @role.downcase == "manager"
      return true
    elsif @role.downcase == "rider"
      return false
    end
  end

  def rider?
    if @role.downcase == "rider"
      return true
    elsif @role.downcase == "manager"
      return false
    end
  end
end
