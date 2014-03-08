module SessionsHelper
  
  def log_in(user)
  	remember_token = User.new_remember_token
  	cookies.permanent[:remember_token] = remember_token
  	user.update_attribute(:remember_token, User.encrypt(remember_token))
  	self.current_user = user
  end

  def logged_in?
  	!current_user.nil?
  end

  def current_user=(user)
  	@current_user = user
  end

  def current_user
  	remember_token = User.encrypt(cookies[:remember_token])
  	@current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user?(user)
    user == current_user
  end

  def log_out
  	current_user.update_attribute(:remember_token, User.encrypt(User.new_remember_token))
  	cookies.delete(:remember_token)
  	self.current_user = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    if request.get?
      session[:return_to] = request.url 
    else
      session[:return_to] = request.referer
    end
  end

  def admin_user
     redirect_to(root_url) unless logged_in? && current_user.admin?
  end

  def admin_user?
    logged_in? && current_user.admin?
  end

  def logged_in_user
    unless logged_in?
      store_location
      redirect_to login_url, alert: "You must be logged in to preform this action."
    end
  end
end
