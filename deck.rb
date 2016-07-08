require_relative 'card'
require_relative 'guess'

class Deck
  attr_reader :cards

  def initialize (cards)
    @cards = cards
  end

  def count
    @cards.length
  end

end
