class PlayerView < View

  def ask_for_hit
    input = nil
    until input == 'n' || input == 'y'
      output("Would you like to hit? y/n")
      input = get_input
    end
    input
  end

  def ask_for_name
    output("What is your name?")
    get_input
  end

  def ask_for_bet_amount(purse_amount)
    output("How much would you like to bet? Purse Amount: #{purse_amount}")
    get_input.to_i
  end
end
