require 'player'

class Round
  attr_reader :attacker, :defender

  def initialize(attacker_dice_count, defender_dice_count)
    @attacker = Player.new(:attack, attacker_dice_count)
    @defender = Player.new(:defend, defender_dice_count)
  end
end
