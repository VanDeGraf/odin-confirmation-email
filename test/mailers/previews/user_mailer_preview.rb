# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def confirmation_email
    user = User.new(name: "Username", confirmation_token: "random_token", confirmation_expired: DateTime.now)
    UserMailer.with(user: user).confirmation_email
  end
end
