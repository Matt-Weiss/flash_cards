class Round
  include Enumerable
  attr_accessor :deck, :turns, :correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct = 0
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, @deck.cards.shift)

    return @turns.last
  end

  def number_correct
    self.turns.each {|turn|
      if turn.guess == turn.card.answer
        @correct += 1
      end}
    @correct
  end

end
