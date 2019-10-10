# frozen_string_literal: true

class RegistrationsMailer < ApplicationMailer
  default from: "rejestracja@konsultacjeobywatelskie.pl"

  def send_confirmation_email(user)
    @user = user
    mail(
      to: user.email,
      subject: t(".subject")
    )
  end
end
