class CreateSections < ActiveRecord::Migration[8.0]
  def change
    create_table :sections do |t|
      t.belongs_to :page, null: false, foreign_key: true
      t.integer :position, default: 0
      t.string :kind, default: 'text'
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
