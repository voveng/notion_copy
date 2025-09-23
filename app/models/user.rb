class User < ApplicationRecord
  has_secure_password :password, validations: true

  validates :email, presence: true, uniqueness: true
  normalizes :email, with: ->(email) { email.strip.downcase }
end
