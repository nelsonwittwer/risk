require 'rspec'
require_relative '../lib/round'

describe Round do 
  let(:round) { Round.new }

  context 'attributes' do
    it { should respond_to :attacker }
    it { should respond_to :defender }
  end

  context 'initialize' do
    it { round.attacker.class.should eq(Player) }
    it { round.defender.class.should eq(Player) }
  end

   context 'attack' do

     before do
       round.role = :attack
       round.roll_dice
     end

     it 'should have 3 dice' do
       round.dice.count.should == 3
     end
   end
end
