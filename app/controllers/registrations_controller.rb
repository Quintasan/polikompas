# frozen_string_literal: true

class RegistrationsController < ApplicationController
  expose(:user)

  def new; end

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
