json.type do
  json.nil!
  	  
  games.each do |game|
  	if game.game_type == type
  	  json.type game, :id, :user_id, :game_type, :bet 
  	end
  end
end