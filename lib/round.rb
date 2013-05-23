require 'player'

class Round
  attr_reader :attacker, :defender

  def initialize
    @attacker = Player.new
    @defender = Player.new
    @attacker.role = :attack
    @defender.role = :defend
  end
end
