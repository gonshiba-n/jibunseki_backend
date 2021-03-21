class ApplicationController < ActionController::API
  before_action :current_user
  helper_method :logged_in?

  def current_user
    remenber_token = User.encrypt(session[:user_remember_token])
    @current_user ||= User.find_by(remenber_token: remenber_token)
  end

  def logged_in?
    @current_user.present?
  end

end
