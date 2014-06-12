module GamesHelper

  def new_deck_for game_id
    Card.destroy_all(game_id:game_id)
  	
    deck = ((0..51).to_a*6).shuffle
    
    suits = %w(h s c d)
    ranks = %w(2 3 4 5 6 7 8 9 10 J Q K A)
    values = [2,3,4,5,6,7,8,9,10,10,10,10,1]
    
    deck.each do |card_num|
      Card.create(game_id:game_id, suit:suits[card_num/13], 
                  rank:ranks[card_num%13], value:values[card_num%13])
    end
  end

  def deal_for(game_id, holder)
  	card = Card.find_by(game_id:game_id.to_i, holder:0)
  	card.update_attribute(:holder, holder.to_i)
  end

  # def game_of_type(games, type)
  #   games.each do |game|
  #     if (game.game_type == type)
  #       return game, :id, :bet
  #     end
  #   end
  # end

  def create_game type
    @game = Game.create(user_id:@user.id, game_type:type)
    new_deck_for @game.id 
  end

  def curl_get_example
    render text: 'Thanks for sending a GET request with cURL!'
  end

  def curl_post_example
    render text: "Thanks for sending a POST request with cURL! Payload: #{request.body.read}"
  end
end
