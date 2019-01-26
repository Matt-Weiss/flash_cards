require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
require './lib/card'
require 'pry'

class CardGeneratorTest < Minitest::Test

  def test_it_exists
    filename = "./data/cards.txt"
    cards = CardGenerator.new(filename)

    assert_instance_of CardGenerator, cards
  end

  def test_pull_txt_file
    filename = "./data/cards.txt"
    cards = CardGenerator.new(filename)
# binding.pry
    assert_equal Card, cards.cards_complete[0].class
  end

end
