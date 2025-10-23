# frozen_string_literal: true

class Page < ApplicationRecord
  belongs_to :workspace
  belongs_to :user
  has_many :sections, dependent: :destroy
  has_ancestry
  before_create :maximize_position

  def d_title
    title.presence || 'Not set'
  end

  def maximize_position
    self.position = siblings.where(workspace: Current.workspace).count + 1
  end
end
