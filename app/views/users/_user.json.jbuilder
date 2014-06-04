json.cache! user do
  json.id @user.id
  json.name @user.name
  json.email @user.email
  json.chips @user.chips
  json.games @games, :id, :game_type, :bet, :player_hand, :dealer_hand
end