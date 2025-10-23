require 'pandoc-ruby'
class Section < ApplicationRecord
  belongs_to :page
  has_rich_text :body

  enum :kind, %w[text dtable dtviewable].index_by(&:itself)
  before_create do
    if text?
      self.body = PandocRuby.convert(File.read(Rails.root.join('lib', 'templates', 'text.md')), from: :markdown,
                                                                                                to: :html5)
    end
  end
end
