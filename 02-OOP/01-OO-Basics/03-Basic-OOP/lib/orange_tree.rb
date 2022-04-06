class OrangeTree
  attr_reader :age
  attr_accessor :fruits
  attr_reader :height
  attr_reader :fruit_picker
  attr_accessor :is_dead

  def initialize
    @age = 0
    @fruits = 0
    @height = 0
    @fruit_picker = 0
    @is_dead = false
  end



  def dead?
    return @is_dead
  end

  def one_year_passes!
    @age += 1
    @height += 1
    @age >= 10 || @age <= 20 if @height = 10
    @fruits = 100 if @age >= 6 && @age <= 9
    @fruits = 200 if @age >= 10 && @age <= 14
    @fruits = 0 if @age >= 15
    my_die
  end

  def pick_a_fruit!
    @fruits -= 1 if @fruits >= 1
  end

  def my_die
    @is_dead = true if @age > rand(50..100)
  end

end
