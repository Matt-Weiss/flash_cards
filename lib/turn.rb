class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess.upcase == @card.answer.upcase
  end

  def feedback
    if correct?
      "Correct"
    else
      "Sorry, incorrect. The answer was #{@card.answer}"
    end
  end

end
