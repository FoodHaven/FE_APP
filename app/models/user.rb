class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def self.from_omniauth(response)
    User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |user|
      user.name = response[:info][:name]
      user.email = response[:info][:email]
      user.password = SecureRandom.hex(15)
    end
  end
end