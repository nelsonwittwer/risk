require 'dice'

class Player
  attr_accessor :role, :dice

  def initialize(dice_count, user_role)
    @dice = []
    dice_count.times do
      @dice << Dice.new.value
    end

    self.role = user_role
  end

  def roll_dice
    sort_dice
  end

private

  def sort_dice
    @dice = @dice.sort.reverse
  end
end
