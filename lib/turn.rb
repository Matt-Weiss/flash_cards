class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == card.answer
  end

  def feedback
    if self.correct?
      "Correct"
    else
      "Sorry, incorrect"
    end
  end

end
