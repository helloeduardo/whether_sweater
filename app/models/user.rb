class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password, presence: { require: true }

  has_secure_password
  has_secure_token :api_key
end
