# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      log_in user
      redirect_to root_url, notice: t(".logged_in_successfully")
    else
      render :new, alert: t(".invalid_email_or_password")
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
