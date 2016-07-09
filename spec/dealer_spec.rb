require 'dealer'

describe Dealer do

  let(:dealer) { Dealer.new }
  let(:card) { Card.new(:spade, :king) }

  describe '#make_last_card_facedown' do
    it 'flips the last card' do
      dealer.add_card_to_hand(card)
      dealer.make_last_card_facedown
      expect(dealer.last_card_in_hand.face_up?).to eq(false)
    end
  end
end
