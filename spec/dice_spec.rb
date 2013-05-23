require 'rspec'
require_relative '../lib/dice'

describe Dice do
  context 'attributes' do
    it { should respond_to :value }
  end 

  context 'intialaize' do
    it 'should be initialized with a number 1-6' do
      d = Dice.new
      d.value.should_not be_nil
    end
  end
end