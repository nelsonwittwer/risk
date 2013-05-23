require 'rspec'
require 'pry'

require_relative '../lib/player'

describe Player do 
  let(:attacker) { Player.new(3, :attack) }
  let(:defender) { Player.new(2, :defend) }

  context 'initialize' do
    it { attacker.dice.class.should eq(Array) }
    it { attacker.role.should eq(:attack) }
    it { defender.dice.class.should eq(Array) }
    it { defender.role.should eq(:defend) }
  end

  context '#roll_dice' do
    context 'attacker' do
      before do 
        attacker.dice = [1, 6, 3]
      end

      it 'should sort dice rolls from highest to lowest' do
        attacker.roll_dice
        attacker.dice.should eq([6, 3, 1])
      end
    end

    context 'defender' do
      before do
        defender.dice = [1, 3]
      end

      it 'should sort dice rolls from highest to lowest' do
        defender.roll_dice
        defender.dice.should eq([3, 1])
      end
    end
  end
end
