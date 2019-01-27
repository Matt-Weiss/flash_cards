class Round
  attr_reader :deck, :turns, :category_hash

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[turns.length]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
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

  def display_categories_with_index
    @category_hash = {1 => :All}
    deck.categories.each_with_index {|category, index|
      category_hash[index+2] = category}
    category_hash.each {|category|
      puts "#{category[0]})  #{category[1]}"}
  end

  def build_deck
    category_selection = 0
    puts "Welcome! Here are the categories available:"
    display_categories_with_index
    until category_hash.keys.include?(category_selection)
      print "Please choose a category (1-#{@category_hash.length})"
      category_selection = gets.chomp.to_i
      if category_selection == 1
        puts "You've selected all categories."
      elsif
        category_hash.keys.include?(category_selection)
        @deck = Deck.new(@deck.cards.select{|card| card.category == category_hash[category_selection]})
        puts "You've selected #{category_hash[category_selection]}"
      else
        puts "Invalid selection, please enter a number 1-#{@category_hash.length}"
      end
    end
  end

  def play
    until turns.length == deck.count do
      puts "\nThis is question #{turns.length+1} of #{deck.count}"
      puts current_card.question
      guess = gets.chomp
      take_turn(guess)
      puts "\n"
      puts turns.last.feedback
      puts "-" * 40
      puts "\n"
    end
    puts "****** Game Over ******"
    puts "You had #{number_correct} out of #{turns.length} correct for a total score of #{percent_correct}%."
    puts "\n"
    return_category_and_percentage_correct
  end


  def start
    build_deck
    puts "\nYou're playing with #{deck.count} cards."
    puts "Questions from Trivial Pursuit Genus IV."
    puts "-" * 43
    play
  end
  
end
