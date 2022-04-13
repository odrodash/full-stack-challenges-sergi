class SessionView
  def ask_for_username
    puts "What is your username?"
    return gets.chomp
  end

  def ask_for_password
    puts "What is your password?"
    return gets.chomp
  end

  def welcome(username)
    puts "Welcome #{username.capitalize}!"
  end

  def error
    puts "Wrong credentials! Try again"
  end
end
