json.cache! user do
  json.id    @user.id
  json.name  @user.name
  json.email @user.email
  json.chips @user.chips

  json.games do

  	json.Beginner do
  	  games.each do |game|
  	    if game.game_type == "Beginner"
  	      json.id game.id
  	      json.user_id game.user_id 
  	      json.game_type game.game_type 
  	      json.bet game.bet
  	      json.min_bet 10
  	      json.max_bet 50
  	    end
  	  end
  	end

	json.Intermediate do  	  
  	  games.each do |game|
  	    if game.game_type == "Intermediate"
		  json.id game.id
  	      json.user_id game.user_id 
  	      json.game_type game.game_type 
  	      json.bet game.bet  	
  	      json.min_bet 50
  	      json.max_bet 100    
  	    end
  	  end
  	end 

	json.set! 'High Roller' do  	  
  	  games.each do |game|
  	    if game.game_type == "High Roller"
		  json.id game.id
  	      json.user_id game.user_id 
  	      json.game_type game.game_type 
  	      json.bet game.bet  	  
  	      json.min_bet 100
  	      json.set! :max_bet do 
  	      	json.nil!
  	      end   
  	    end
  	  end
  	end
  end
end