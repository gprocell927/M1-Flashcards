require_relative 'round'
require_relative 'guess'
require_relative 'deck'
require_relative 'card'
require_relative 'cards-text'

filename = "./cards.txt"

cards = CardGenerator.new(filename).cards

deck = Deck.new(cards)

round = Round.new(deck)

round.start
