require_relative 'card'
require_relative 'guess'
require_relative 'deck'

class Round
  attr_reader :deck, :guesses

  def initialize (deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    @deck.cards[0]
  end

  def record_guess(response)
    guesses << Guess.new(response, current_card)
    guesses.last
  end

  def number_correct
    num_correct = 0
    guesses.each do |guess|
      num_correct += 1 if guess.correct?
    end
    num_correct
  end

  def percent_correct
    ((number_correct.to_f / deck.count)*100).to_i
  end

  def start
    deck_total = deck.count
    puts "Welcome! You're playing with #{deck_total} cards."
    puts "-------------------------------------------------"

    1.upto(deck_total) do |n|
      puts "This is card number #{n} out of #{deck_total}."
      puts "Question: #{current_card.question}"
      response = gets.chomp.downcase
      guess = record_guess(response)
      puts guess.feedback
      deck.cards.shift
      deck.cards << "placeholder"
    end

    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{deck_total} for a score of #{percent_correct}%."
  end
end
