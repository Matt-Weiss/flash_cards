require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require 'pry'

card_1 = Card.new("What river was designated the U.S.-Mexican border in the Treaty of Guadalupe Hidalgo?", "Rio Grande", :People_and_Places)
card_2 = Card.new("What was the first U.S. sitcom to be exported to Britain?", "I Love Lucy", :Arts_and_Entertainment)
card_3 = Card.new("What was the first company in the world to post $1 billion in annual earnings, in 1955?", "General Motors", :History)
card_4 = Card.new("What's the top apple-producing state in the U.S.?", "Washington", :Science_and_Nature)
card_5 = Card.new("How many rounds can an Olympic boxing match last?", "Three", :Sports_and_Leisure)
card_6 = Card.new("What ministry in George Orwell's 1984 was responsible for conducting wars?", "Ministry of Peace", :Wild_Card)
cards = [card_1, card_2, card_3, card_4, card_5, card_6]
deck = Deck.new(cards)
round = Round.new(deck)

round.start
until round.deck.cards.length == 0 do
  p "This is question #{round.turns.length+1} of #{round.deck.count + round.turns.length}"
  p round.current_card.question
  guess = gets.chomp
  round.take_turn(guess)
  p round.turns.last.feedback
  p "-" * 40
end

p "****** Game Over ******"
p "You had #{round.number_correct} out of #{round.turns.length} correct for a total score of #{round.percent_correct}%."
