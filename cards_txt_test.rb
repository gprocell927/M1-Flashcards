gem 'minitest', '~> 5.9.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'deck.rb'
require_relative 'card.rb'
require_relative 'cards-text'

class CardGeneratorTest < Minitest::Test

  def test_if_generates_card
    card_1 = Card.new("What is 5 + 5?", "10")
    card_2 = Card.new("What is Gabi's favourite animal?", "sloth")
    card_3 = Card.new("What is Gabi's middle name?", "danger")
    card_4 = Card.new("What is your quest?", "to seek the holy grail")
    deck = Deck.new([card_1, card_2, card_3, card_4])
    assert_equal "cards.txt", filename
  end


end
