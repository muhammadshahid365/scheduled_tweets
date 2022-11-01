class User < ApplicationRecord
  has_secure_password

  has_many :twitter_accounts
  has_many :tweets

  validates :email, presence: true, format: { with: /[^@\s]+@[^@\s]+/, message: 'please enter a valid email address'}
end
