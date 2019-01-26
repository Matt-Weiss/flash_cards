class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[turns.length]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    return @turns.last
  end

  def number_correct
    correct = 0
    turns.each {|turn|
      if turn.correct?
        correct += 1
      end}
    correct
  end

  def number_correct_by_category(category)
    correct = 0
    turns.each {|turn|
      if turn.correct? && turn.card.category == category
      correct +=1
      end}
    correct
  end

  def percent_correct
    (100 * self.number_correct.to_f/self.turns.length).round(2)
  end

  def percent_correct_by_category(category)
    category_total = 0
    turns.each {|turn|
      if turn.card.category == category
      category_total +=1
      end}
    100 * number_correct_by_category(category).to_f/category_total
  end

  def return_category_and_percentage_correct
    deck.categories.each {|category|
    puts "#{category}---#{percent_correct_by_category(category)}%"}
  end

  def start
    p "Welcome! You're playing with #{deck.count} cards."
    p "Questions from Trivial Pursuit Genus IV."
    p "-" * 40
  end

end
