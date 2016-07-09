class Card
  attr_reader :suit, :rank
  def initialize(suit, rank, face_up = true)
    @suit = suit
    @rank = rank
    @face_up = face_up
  end

  def value
    convert_rank_to_value
  end

  def face_up?
    @face_up
  end

  def face_down?
    !@face_up
  end

  def flip
    @face_up ^= true
  end

  private

  def convert_rank_to_value
    if @rank == :ace
      @value
    elsif @rank.is_a?(Symbol)
      return 10 if [:jack, :queen, :king].include?(@rank)
    else
      @rank
    end
  end
end
