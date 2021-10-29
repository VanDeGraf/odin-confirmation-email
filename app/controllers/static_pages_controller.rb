class StaticPagesController < ApplicationController
  def email
    @user = user_from_params
    if @user.nil?
      @user = User.new
    else
      set_user_confirmation_data(@user)
      flash.now[:notice] = "Confirmation E-mail will be send"
      @user.save
      UserMailer.with(user: @user).confirmation_email.deliver!
    end
  end

  def confirmation
    @user = nil
    if params.key?(:confirmation_token)
      permitted = params.permit(:confirmation_token)
      founded = User.find_by(confirmation_token: permitted[:confirmation_token])
      unless founded.nil? || founded.confirmed? || founded.expired?
        @user = founded
        @user.confirmed = true
        @user.save
      end
    end
  end

  private

  def user_from_params
    return nil unless params.key?(:user) &&
      params.require(:user).key?(:email) &&
      params.require(:user).key?(:name)

    permitted = params.require(:user).permit(:name, :email)
    user = User.new(name: permitted[:name], email: permitted[:email])
    unless user.valid?
      flash.now[:alert] = "Form input validation error"
      return nil
    end

    founded = User.find_by(email: user.email)
    unless founded.nil?
      if founded.confirmed?
        flash.now[:alert] = "E-mail already confirmed!"
        return nil
      else
        return founded
      end
    end

    user
  end

  def set_user_confirmation_data(user)
    user.confirmation_expired = DateTime.now.next_day
    user.confirmation_token = SecureRandom.hex
  end
end