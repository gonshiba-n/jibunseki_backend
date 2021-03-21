class RegistrationsController < ApplicationController

  def create
    @user = User.new(registrations_params)

    if @user.save
      login(@user)
      render json: {status: :created, user: @user}
    else
      render json: {status: 500}
    end
  end

  private

  def registrations_params
    params.require(:user)
    .permit(:name, :email, :password, :password_confirmation)
  end

end
