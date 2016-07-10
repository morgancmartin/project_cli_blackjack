class HumanPlayer < Player
  def initialize(options = {})
    super
    @view = PlayerView.new
    @purse = options[:purse] ? options[:purse] : 100
    @bet = 0
  end

  def hit?
    result = @view.ask_for_hit
    result == 'y' ? true : false
  end

  def handle_blackjack_bet
    @purse += (@bet * (1.5)).round(0) + @bet
    @bet = 0
  end

  def handle_winning_bet
    @purse += (@bet * 2)
    @bet = 0
  end

  def regain_bet
    @purse += @bet
    @bet = 0
  end

  def lose_bet
    @bet = 0
  end

  def blackjack?
    @hand.blackjack?
  end

  def make_bet
    @bet = nil
    until !@bet.nil? && @bet < @purse
      @bet = @view.ask_for_bet_amount(purse_amount)
    end
    @purse -= @bet
  end

  def purse_amount
    @purse
  end

  def purse_empty?
    @purse <= 0
  end

  def assign_name
    @name = @view.ask_for_name
  end
end
