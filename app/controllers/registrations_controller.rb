# frozen_string_literal: true

class RegistrationsController < ApplicationController
  expose(:user)

  def new; end

  def create
    if user.valid?
      user.confirmation_token = Digest::SHA256.hexdigest(Time.now.to_s)
      user.save
      RegistrationsMailer.send_confirmation_email(user).deliver
      redirect_to root_url, flash: { success: t(".confirmation_email_sent") }
    else
      render :new
    end
  end

  def confirm
    token = confirmation_params[:token]
    user = User.find_by(confirmation_token: token)
    if user && !user.confirmed_at
      user.confirmed_at = Time.now
      user.save
      redirect_to root_url, flash: { success: t(".confirmation_success") }
    else
      redirect_to root_url, flash: { error: t(".confirmation_failure") }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def confirmation_params
    params.permit(:token)
  end
end
