class UserMailer < ApplicationMailer

  def confirmation_email
    # @type [User]
    @user = params[:user]
    @url = "http://127.0.0.1:3000/confirmation/" + @user.confirmation_token
    mail(to: @user.email, subject: "E-mail confirmation")
  end
end
