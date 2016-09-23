helpers do
  def current_user
    if session[:user_id]
		  @user ||= User.find(session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session[:user_id] = nil
    current_user = nil
  end
end