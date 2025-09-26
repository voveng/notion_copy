# frozen_string_literal: true

class Page < ApplicationRecord
  belongs_to :workspace
  belongs_to :user

  def d_title
    title.presence || 'Not set'
  end
end
