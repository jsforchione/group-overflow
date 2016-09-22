helpers do 
  def current_user
    @user ||= User.find(session[:user]) if session[:user]
  end 
end 