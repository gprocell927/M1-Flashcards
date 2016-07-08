gem 'minitest', '~> 5.9.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'card.rb'

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
