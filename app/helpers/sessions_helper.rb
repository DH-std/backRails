module SessionsHelper

  def sign_in(user)
    remember_token = User.new_remember_token
    cookies[:remember_token] = { value: remember_token, 
                                 id: user.id, 
    							               expires: 1.day.from_now.utc }
    user.update_attribute(:remember_token, User.digest(remember_token))
    self.current_user = user
    ##
    puts self.current_user.name
  end

  def current_user=(user)
    @current_user = user
    puts "hhhhhhheeereereeeee!!!!!!!!!!!!!!!"
  end

  def current_user

    puts "get back please where do i find you oooh nooooooo"
	  remember_token = User.digest(cookies[:remember_token])
    puts cookies[:remember_token]
    puts remember_token
    puts "&&&&&&&&&&&&&&&&&&&&&&&&"
    @current_user ||= User.find_by(remember_token: remember_token) 
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in?
    !current_user.nil?
  end
  
  def sign_out
    ##
    puts signed_in?
    current_user.update_attribute(:remember_token,
                                  User.digest(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end
end
