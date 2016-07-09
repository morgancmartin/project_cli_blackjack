require 'human_player'
require 'view'
require 'player_view'

describe HumanPlayer do

  let(:human) { HumanPlayer.new }
  let(:poor_human) { HumanPlayer.new( { purse: 0 } )}


  describe '#purse_amount' do
    it 'starts out at 100' do
      expect(human.purse_amount).to eq(100)
    end
  end

  describe '#empty_purse?' do
    it 'returns false if purse is not empty' do
      expect(human.empty_purse?).to eq(false)
    end

    it 'returns true if purse is empty' do
      expect(poor_human.empty_purse?).to eq(true)
    end
  end
end
