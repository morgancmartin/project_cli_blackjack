require 'deck_empty_error'
class Deck
  def initialize
    @cards = new_deck
  end

  def size
    @cards.size
  end

  def add_card(card)
    @cards << card
  end

  def get_card
    empty? ? (raise DeckEmptyError) : @cards.pop
  end

  private

  def empty?
    @cards.empty?
  end

  def ranks
    (1..10).to_a << :jack << :queen << :king
  end

  def shuffle
    @cards.shuffle
  end

  def suits
    [:spade, :heart, :diamond, :club]
  end

  def new_deck
    return_array = []
    ranks.each do |rank|
      suits.each do |suit|
        return_array << Card.new(suit, rank)
      end
    end
    return_array
  end
end
