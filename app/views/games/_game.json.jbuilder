json.cache! @game do
  json.id        @game, :id
  json.user_id   @game, :user_id 
  json.game_type @game, :game_type 
  json.bet       @game, :bet
end