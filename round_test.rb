gem 'minitest', '~> 5.9.0'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'round.rb'

class RoundTest < Minitest::Test
  def test_for_round
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    assert_equal ([card_1, card_2]), deck.cards
    round = Round.new(deck)
  end

  def test_to_count_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guesses = round.guesses
    assert_equal [], guesses
  end

  def test_shows_current_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    current_card = round.current_card
    assert_equal card_1, current_card
  end

  def test_to_record_guess
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    response = round.record_guess ("Juneau")
    assert_instance_of Guess, response
    assert_instance_of Card, response.card
    assert_equal "Correct!", response.feedback
  end

  def test_to_count_guesses_in_a_round
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.record_guess("Juneau")
    assert_equal 1, round.guesses.count
    assert_equal "Correct!", round.guesses.first.feedback
    round.record_guess("Mars")
    assert_equal 2, round.guesses.count
    assert_equal "Correct!", round.guesses.first.feedback
  end

  def test_number_of_correct_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.record_guess("Juneau")
    round.number_correct
    assert_equal 1,round.number_correct
  end

  def test_percentage_of_correct_guesses
   card_1 = Card.new("What is the capital of Alaska?", "Juneau")
   card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
   deck = Deck.new([card_1, card_2])
   round = Round.new(deck)
   round.record_guess("Juneau")
   round.record_guess("Pluto")
   round.number_correct
   round.percent_correct
   assert_equal 50, round.percent_correct
  end


end
