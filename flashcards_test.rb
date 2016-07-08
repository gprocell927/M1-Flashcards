# location: turing/1module/Flashcards
gem 'minitest', '~> 5.9.0' #tells our code where to find minitest
require 'minitest/autorun' #tells our code to load minitest
require 'minitest/pride' #adds pretty colors to terminal when tests are run.
require_relative 'card.rb' # require_relative means look for a file named flashcards.rb in the directory path
#relative to the current file that we're in

class CardTest < Minitest::Test

  def test_asks_question_alaska
    card = Card.new("What is the capital of Alaska?", "Juneau")

    assert_equal "What is the capital of Alaska?", card.question
    assert_equal "Juneau", card.answer

  end

  def test_asks_question
    card = Card.new("What is the capital of Wisconsin?", "Madison")

    assert_equal "What is the capital of Wisconsin?", card.question
    assert_equal "Madison", card.answer
  end


end
