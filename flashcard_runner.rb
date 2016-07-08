require_relative 'round'
require_relative 'guess'
require_relative 'deck'
require_relative 'card'

card_1 = Card.new("What is 5 + 5?", "10")
card_2 = Card.new("What is Gabi's favourite animal?", "sloth")
card_3 = Card.new("What is Gabi's middle name?", "danger")
card_4 = Card.new("What is your quest?", "to seek the holy grail")

deck = Deck.new([card_1, card_2, card_3, card_4])

round = Round.new(deck)

round.start
