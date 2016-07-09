class PlayerView < View
  def ask_for_name
    output("What is your name?")
    get_input
  end

  def ask_for_bet_amount
    output("How much would you like to bet?")
    get_input.to_i
  end

  def output(info)
    puts info
  end
end
