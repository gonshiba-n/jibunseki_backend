class SessionsController < ApplicationController
  before_action :set_user, only: [:create]

  def new
    @user = User.new
  end

  def create
    if @user&.authenticate(sessions_params[:password])
      login(@user)
      render json: {status: :created, user: @current_user}
      puts 'OK'
    else
      render json: {status: 500, message: 'メールアドレスとパスワードの組み合わせが間違っています。'}
      puts 'NG'
      puts "#{@current_user}"
    end
  end

  private
    def set_user
      @user = User.find_by(email: sessions_params[:email])
            puts 'beforeOK'
    rescue
      render json: {status: 500, message: 'メールアドレスとパスワードの組み合わせが間違っています。'}
            puts 'beforeNG'
    end

    def sessions_params
      params.require(:user)
      .permit(:email, :password)
    end
end
