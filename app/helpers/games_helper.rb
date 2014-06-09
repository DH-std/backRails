module GamesHelper

  def new_deck_for game_id
  	game = Game.find(game_id.to_i)
  	deck = ((1..52).to_a*6).shuffle
    game.update_attribute(:deck, Marshal::dump(deck))
  end

  def deal_for game_id 
  	game = Game.find(game_id.to_i)
  	deck = Marshal::load(game.deck)
  	card = deck.pop
  	game.update_attribute(:deck, Marshal::dump(deck))
  	card
  end
end
