class GamesController < ApplicationController
  include GamesHelper

  # before_action :signed_in_user

  def create
  	# puts "new_deck"
  end

  def show 
  	puts "id ===="
  	puts params[:id]
  	@deck = new_deck_for params[:id]
  	deal_for params[:id]
  	deal_for params[:id]
  end 

  def destroy
  end
end