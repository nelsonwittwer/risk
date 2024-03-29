require 'dice'

class Player
  attr_accessor :role, :dice

  def initialize(user_role, dice_count)
    set_role(user_role)
    set_dice(dice_count)
    sort_dice
  end

private

  def set_dice(dice_count)
    @dice = []
    dice_count.times do
      @dice << Dice.new.value
    end

    if @role == :attack && @dice.count > 3 || @dice.count < 1
      raise Error
    end

    if @role == :defend && @dice.count > 2 || @dice.count < 1
     raise Error
    end
  end

  def set_role(user_role)
    if user_role == :attack || user_role == :defend
      self.role = user_role
    else
      raise Error
    end
  end

  def sort_dice
    @dice = @dice.sort.reverse
  end
end
