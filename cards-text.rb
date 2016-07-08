class CardGenerator


  def initialize (filename)
    new_cards = File.read(filename).split("\n")
    @new_cards_qa = []
    @new_cards_qa = new_cards.map do |card|
      card.split(", ")
    end
  end

  def cards
    cards = @new_cards_qa.map do |card|
      Card.new(card[0],card[1])
    end
  end


  end
