class SessionsController < ApplicationController

	def new 
	end

	def create 
		user = User.find_by(email: params[:email].downcase)
    	if user && user.authenticate(params[:password])
      		sign_in user
      		# redirect_back_or user
      		# params[:format] = "json"
          if params[:format] == "json" 
            redirect_to "/users/#{user.id}.json"
          else
      		  redirect_to user
          end
    	else
        respond_to do |format|
          format.html do 
            flash.now[:error] = 'Invalid email/password combination'
            render 'new'
          end 

          format.json do 
            render json: { :error => "XXXXYYYZZZ" }, :status => 422
          end
        end
    	end
	end

	def destroy 
    # binding.pry
    sign_out
    redirect_to root_url
  end

  def csrf
    response.header['X-CSRF-Token'] = form_authenticity_token
  end
end