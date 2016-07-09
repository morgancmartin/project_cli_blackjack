class Hand
  def initialize(cards = [])
    @cards = cards
  end

  def bust?
    if contains_aces? && total_value_over_twenty_one?
      toggle_ace if contains_untoggled_aces?
      total_value_over_twenty_one?
    else
      total_value_over_twenty_one?
    end
  end

  def total_value
    return 0 if @cards.nil?
    @cards.map { |card| card.value }.reduce(:+)
  end

  def last_card
    @cards.last
  end

  def flip_last_card
    @cards.last.flip
  end

  def num_of_cards
    @cards.size
  end

  def add_card(card)
    card.is_a?(Ace) ? add_ace(card) : @cards << card
  end

  private

  def add_ace(ace)
    @cards << total_value + 11 > 21 ? ace.toggle_value : ace
  end

  def toggle_ace
    get_first_untoggled_ace.toggle_value
  end

  def get_first_untoggled_ace
    @cards.each do |card|
      return card if card.is_a?(Ace) && card.untoggled?
    end
    nil
  end

  def contains_untoggled_aces?
    @cards.select { |card| card.is_a?(Ace) }.any? { |ace| ace.untoggled? }
  end

  def contains_aces?
    @cards.any? { |card| card.is_a?(Ace) }
  end

  def total_value_over_twenty_one?
    total_value > 21
  end
end
