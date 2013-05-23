require 'rspec'
require 'pry'

require_relative '../lib/player'

describe Player do 
  let(:player) { Player.new }

  context 'attributes' do
    it { should respond_to :role }
  end 

  context 'initialize' do
    it { player.dice.class.should eq(Array) }
  end

  context '#roll_dice' do
    before do 
      player.stub(:assign_dice) { [1, 6, 3] } 
      player.role = :attack
    end

    it 'should sort dice rolls from highest to lowest' do
      player.roll_dice
      player.dice.should eq([6, 3, 1])  
    end
  end

  context 'attack' do

    before do
      player.role = :attack
      player.roll_dice
    end

    it 'should have 3 dice' do
      player.dice.count.should == 3
    end
  end
end
