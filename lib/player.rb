class Player
  attr_reader :name
  def initialize(options = {})
    @hand = Hand.new
  end

  def add_card_to_hand(card)
    @hand.add_card(card)
  end
end
