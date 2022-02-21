class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :comments, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:github]

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    unless user
      user = User.create(
         email: data['email'],
         provider: access_token.provider,
         uid: access_token.uid,
         password: Devise.friendly_token[0, 20]
      )
    end
    user
  end
end
