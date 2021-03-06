class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      set_up_account
    else
      render 'new'
    end
  end

  def edit 
  end 

  def show 
  	@user = User.find(params[:id])
    @games = @user.games.all

  	respond_to do |format|
  	  format.html
      format.json { render }
  	end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    def set_up_account 
      create_game "Beginner"
      create_game "Intermediate"
      create_game "High Roller"
    end

    
end
