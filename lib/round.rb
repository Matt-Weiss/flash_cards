class Round
  include Enumerable
  attr_accessor :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, @deck.cards.shift)

    return @turns.last
  end

  def number_correct
    correct = 0
    self.turns.each {|turn|
      if turn.correct?
        correct += 1
      end}
    correct
  end

  def number_correct_by_category(category)
    correct = 0
    self.turns.each {|turn|
      if turn.correct? && turn.card.category == category
      correct +=1
      end}
    correct
  end

  def percent_correct
    100 * self.number_correct.to_f/self.turns.length
  end

  def percent_correct_by_category(category)
    category_total = 0
    self.turns.each {|turn|
      if turn.card.category == category
      category_total +=1
    end}
    100 * self.number_correct_by_category(category).to_f/category_total
  end

end
