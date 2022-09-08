# frozen_string_literal: true

class WelcomeEmailMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail to: @user.email, subject: "Welcome #{user.username}"
  end
end
