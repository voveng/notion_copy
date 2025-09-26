# frozen_string_literal: true

class Workspace < ApplicationRecord
  belongs_to :user
  has_many :pages, dependent: :destroy
  validates :title, presence: true
end
