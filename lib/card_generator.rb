class CardGenerator
attr_reader :cards_complete
  def initialize(filename)
    cards_list = File.new(filename)
    card_lines = cards_list.readlines
    cards_raw_data = card_lines.collect {|line| line.chomp.split(", ")}
    cards_cleanup = cards_raw_data.map {|card| [card[0], card[1], (card[2].delete ":").to_sym]}
    @cards_complete = cards_cleanup.collect {|card| Card.new(card[0], card[1], card[2])}
  end
end
