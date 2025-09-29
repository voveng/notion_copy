# frozen_string_literal: true

class Page < ApplicationRecord
  belongs_to :workspace
  belongs_to :user
  has_ancestry
  before_create :maximaize_position
  def d_title
    title.presence || 'Not set'
  end

  def maximaize_position
    self.position = siblings.where(workspace: Current.workspace).count + 1
  end
end
