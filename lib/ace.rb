class Ace < Card
  attr_reader :value

  def initialize(suit, rank, face_up = true)
    super
    @value = 11
  end

  def toggle_value
    @value = @value == 1 ? 11 : 1
  end

  def untoggled?
    @value == 11 
  end
end
