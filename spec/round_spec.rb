require 'rspec'
require_relative '../lib/round'

describe Round do 
  let(:round) { Round.new(3, 2) }

  context 'initialize' do
    it { round.attacker.class.should eq(Player) }
    it { round.attacker.dice.count.should eq(3) }
    it { round.defender.class.should eq(Player) }
    it { round.defender.dice.count.should eq(2) }
  end

end
