require 'rspec'
require 'pry'

require_relative '../lib/player'

describe Player do 
  let(:attacker) { Player.new }
  let(:defender) { Player.new }

  context 'attributes' do
    it { should respond_to :role }
  end 

  context 'initialize' do
    it { attacker.dice.class.should eq(Array) }
    it { defender.dice.class.should eq(Array) }
  end

  context '#roll_dice' do
    context 'attacker' do
      before do 
        attacker.stub(:assign_dice) { [1, 6, 3] } 
        attacker.role = :attack
      end

      it 'should sort dice rolls from highest to lowest' do
        attacker.roll_dice
        attacker.dice.should eq([6, 3, 1])
      end
    end

    context 'defender' do
      before do
        defender.stub(:assign_dice) { [1, 3] } 
        defender.role = :defend
      end

      it 'should sort dice rolls from highest to lowest' do
        defender.roll_dice
        defender.dice.should eq([3, 1])
      end
    end
  end
end
