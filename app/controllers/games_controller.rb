class GamesController < ApplicationController
  include GamesHelper

  # before_action :signed_in_user

  def show 
  end 

  def play
    @user = User.select("id, name, email, chips").find(params[:id])
    @game = Game.select("id, user_id, game_type, bet").find(params[:game_id])
    @player_hand = Card.select("id, game_id, suit, rank, value").where(game_id:params[:game_id], holder:1)
    @dealer_hand = Card.select("id, game_id, suit, rank, value").where(game_id:params[:game_id], holder:-1)

    if params[:move] == "New Game" 


      Card.destroy_all(game_id:params[:game_id], holder:1)
      Card.destroy_all(game_id:params[:game_id], holder:-1)

      if Card.where(game_id:params[:game_id]).count < 100 
        new_deck_for params[:game_id]
      end
      status = "bet"


    elsif params[:move] == "Continue"
      

      if @game.bet == nil
        status = "bet"
      elsif @dealer_hand.count == 1
        if @player_hand.count == 2 
          status = "init"
        else
          status = 'hit'
        end
      elsif @dealer_hand.count > 1
        status = get_result
      else 
        status = "how to continue"
      end
    

    elsif params[:move] == "Bet" 


      @game.bet = params[:bet]
      Game.find(@game.id).update_attribute(:bet, params[:bet].to_i)
      @user.chips = @user.chips - params[:bet].to_i
      User.find(@user.id).update_attribute(:chips, @user.chips)

      deal_for @game.id, '1'
      deal_for @game.id, '-1'
      deal_for @game.id, '1'

      player_hand = Card.select("id, game_id, suit, rank, value").where(game_id:params[:game_id], holder:1)
      dealer_hand = Card.select("id, game_id, suit, rank, value").where(game_id:params[:game_id], holder:-1)

      status = "init"


    elsif params[:move] == "Hit"


      deal_for @game.id, '1'
      status = "hit"


    elsif params[:move] == "Stand"


      if hand_value_for('-1') < 17
        deal_for @game.id, '-1'
      end
      status = get_result


    elsif params[:move] == "Double"
      @user.chips = @user.chips - @game.bet
      User.find(@user.id).update_attribute(:chips, @user.chips)
      @game.bet *= 2
      Game.find(@game.id).update_attribute(:bet, @game.bet)
      
      deal_for @game.id, '1'

      status = get_result
    else 
      puts "====== Unknown ACtion #{params[:move]} ======"
      status = "what is this"
    end  

    stat = {user:@user, game:@game, player_hand:@player_hand, dealer_hand:@dealer_hand, status:status}
    render json: stat
  end

  def destroy
  end

  private
    def game_stat
      stat = { msg:'hello', msg2:'world' }.to_json
    end

    def get_result 
      Game.find(@game.id).update_attribute(:bet, nil)
      'Need code'
    end

    def hand_value_for holder
      cards = Card.select("value").where(game_id:@game.id, holder:holder.to_i)
      point = 0
      ace = 0
      
      cards.each do |card| 
        point += card.value
        if card.value == 1 
          ace += 1
        end
      end 

      while point < 13 and ace > 0 do
        point += 9
        ace -= 1
      end

      point
    end
end