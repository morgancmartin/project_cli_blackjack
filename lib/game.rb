class Game

  def initialize
    @player = HumanPlayer.new
    @dealer = Dealer.new
    @view = GameView.new(@player, @dealer)
    @deck = Deck.new
  end

  def play
    @player.assign_name
    round_loop
    print_game_results
  end

  private

  def round_loop
    until @player.purse_empty?
      deal
      @player.make_bet
      hit_loop(@player)
      hit_loop(@dealer) unless @player.bust?
      print_round_results
    end
  end

  def hit_loop(competitor)
    until competitor.bust?
      competitor.hit? ? competitor.hit : break
    end
  end

  def deal
    deal_player_cards(@player, 2)
    deal_player_cards(@dealer, 2)
    @dealer.make_last_card_facedown
    @view.print_dealt_cards
  end

  def deal_player_cards(player, num_of_cards)
    cards = get_cards_from_deck(num_of_cards)
    add_cards_to_players_hand(player, cards)
  end

  def add_cards_to_players_hand(player, cards)
    cards.each { |card| player.add_card_to_hand(card) }
  end

  def get_cards_from_deck(num_of_cards)
    cards = []
    num_of_cards.times { cards << @deck.get_card }
    cards
  end
end
