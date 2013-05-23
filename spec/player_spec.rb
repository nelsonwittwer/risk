require 'rspec'
require 'pry'

require_relative '../lib/player'

describe Player do 
  let(:attacker) { Player.new(:attack, 3) }
  let(:defender) { Player.new(:defend, 2) }

  context 'initialize' do
    it { attacker.dice.class.should eq(Array) }
    it { attacker.dice.count.should eq(3) }
    it { attacker.role.should eq(:attack) }
    it { defender.dice.class.should eq(Array) }
    it { defender.dice.count.should eq(2) }
    it { defender.role.should eq(:defend) }

    context 'role constraints' do
      context 'for attackers' do
        it 'should limit attacker dice count to 3' do
          expect { Player.new(4, :attack) }.to raise_error
        end

        it 'should require at least 1 dice' do
          expect { Player.new(0, :attack) }.to raise_error
        end
      end

      context 'for defenders' do
        it 'should limit defender dice count to 2' do
          expect { Player.new(3, :defend) }.to raise_error
        end

        it 'should require at least 1 dice' do
          expect { Player.new(0, :defend) }.to raise_error
        end
      end
    end
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
