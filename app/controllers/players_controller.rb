class PlayersController < ApplicationController
  def new
  end

  def create 
  end

  def edit 
  end 

  def show 
  	@player = User.find(params[:id])

  	respond_to do |format|
  	  format.json { render }
  	  format.html 
  	end
  end
end
