require 'player'
class Dealer < Player
  def make_last_card_facedown
    @hand.flip_last_card unless last_card_in_hand.face_down?
  end

  def last_card_in_hand
    @hand.last_card
  end
end
