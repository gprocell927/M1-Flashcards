require_relative 'card.rb'
class Guess
  attr_reader :card, :response 
  def initialize (response,card)
    @card = card
    @response = response
  end

  def correct?
    @response == @card.answer
  end

  def feedback
    if correct? == true
      "Correct!"
    else
      "Incorrect"
    end
  end

end
