require_relative "animal"
class Chicken < Animal
  attr_reader :eggs
  def initialize(gender)
    @energy = 0
    @gender = gender
    @eggs = 0
  end

  def talk
    if @gender.downcase == "female"
      return "cluck cluck"
    elsif @gender.downcase == "male"
      return "cock-a-doodle-doo"
    end
  end

  def feed!
    super
    @eggs += 2 unless @gender.downcase == "male"
  end

end
