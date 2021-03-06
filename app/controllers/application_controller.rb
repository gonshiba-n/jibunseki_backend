class ApplicationController < ActionController::API
  include ActionController::Helpers

  before_action :current_user
  helper_method :logged_in?

  def current_user
    remember_token = User.encrypt(session[:user_remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def login(user)
    remember_token = User.new_remember_token
    session[:user_remember_token] = remember_token
    user.update!(remember_token: User.encrypt(remember_token))
    @current_user = user
  end

  def logout
    @current_user = nil
    reset_session
  end

  def logged_in?
    if @current_user
      render json: { logged_in: true, user: @current_user }
    else
      render json: { logged_in: false, message: "ユーザーが存在しません" }
    end
  end

end
