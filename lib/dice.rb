class Dice
  attr_reader :value
  
  def initialize
    @value = rand(1..6)
  end
end