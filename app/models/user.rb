class User < ApplicationRecord
  require 'securerandom'

  validates :name,
            presence: true,
            length: { in: 3..30 }
  validates :email,
            presence: true,
            length: { in: 5..50 },
            format: /@/



  def expired?
    return true if confirmation_expired.nil?

    DateTime.current >= confirmation_expired
  end
end
