module SessionsHelper
	def sign_in(user)
    	cookies.permanent[:remember_token] = user.remember_token
    	self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

	def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token]) #This practice of evaluating || expressions from left to right and stopping on the first true value is known as short-circuit evaluation.
  end
  
  def current_user?(user)
    user == current_user
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def signed_in?
    !current_user.nil?
  end

  def signed_out?
    current_user.nil?
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end
end
