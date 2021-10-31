class UserMailer < ApplicationMailer

  def confirmation_email
    # @type [User]
    @user = params[:user]
    @url = "http://#{ENV['host']}/confirmation/" + @user.confirmation_token
    mail(to: @user.email, subject: "E-mail confirmation")
  end
end
