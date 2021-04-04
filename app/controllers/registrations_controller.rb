class RegistrationsController < ApplicationController

  def create
    @user = User.new(registrations_params)

    if @user.save
      login(@user)
      render json: {status: :created, user: @current_user}
    else
      error_message = @user.errors.keys.map {|key| [key, @user.errors.full_messages_for(key)]}.to_h
      render json: {status: 500, message: error_message}
    end
  end

  private

  def registrations_params
    params.require(:user)
    .permit(:name, :email, :password, :password_confirmation)
  end

end