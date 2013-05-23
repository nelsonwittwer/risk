require 'dice'

class Player
  ROLE_ATTRIBUTES = {
    :attack => 3,
    :defend => 2
  }.freeze

  attr_accessor :role, :dice

  def initialize
    @dice = []
  end

  def roll_dice
    @dice = assign_dice
    sort_dice
  end

private

  def assign_dice
    dice = []
    ROLE_ATTRIBUTES[self.role].times do
      dice << Dice.new.value
    end

    return dice
  end

  def sort_dice
    @dice = @dice.sort.reverse
  end

end
