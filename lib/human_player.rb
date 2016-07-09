class HumanPlayer < Player
  def initialize(options = {})
    super
    @view = PlayerView.new
    @purse = options[:purse] ? options[:purse] : 100
  end

  def bust?
    @hand.bust?
  end

  def make_bet
    until @bet < @purse
      @bet = @view.ask_for_bet_amount
    end
    @purse -= @bet
  end

  def purse_amount
    @purse
  end

  def empty_purse?
    @purse <= 0
  end

  def assign_name
    @name = @view.ask_for_name
  end
end
