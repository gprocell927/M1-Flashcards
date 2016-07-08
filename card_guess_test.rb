
gem 'minitest', '~> 5.9.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'guess.rb'

class GuessTest < Minitest::Test
  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau")
    @card2 = Card.new("Which plant is closest to the sun?", "Mercury")
    @guess = Guess.new("Juneau", @card)
    @guess2 = Guess.new("Saturn", @card2)
  end

  def test_guess_knows_card

    assert @guess.card.is_a?(Card)
  end

  def test_for_response
    assert_equal "Juneau", @guess.response
    assert_equal "Saturn", @guess2.response
  end

  def test_if_correct
    assert @guess.correct?
    refute @guess2.correct?
  end

  def test_for_feedback
    assert_equal "Correct!",@guess.feedback
    assert_equal "Incorrect", @guess2.feedback
  end
end
