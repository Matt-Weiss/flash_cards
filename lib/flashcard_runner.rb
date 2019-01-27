require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/card_generator'
require 'pry'

cards = CardGenerator.new('./data/cards.txt').cards_complete
deck = Deck.new(cards)
round = Round.new(deck)

round.start
