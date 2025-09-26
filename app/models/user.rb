# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password :password, validations: true
  has_many :workspaces, dependent: :destroy
  validates :email, presence: true, uniqueness: true
  normalizes :email, with: ->(email) { email.strip.downcase }
end
