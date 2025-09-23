class CreatePages < ActiveRecord::Migration[8.0]
  def change
    create_table :pages do |t|
      t.belongs_to :workspace, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.string :title
      t.boolean :frontpage, default: false
      t.string :ancestry, default: "/"

      t.timestamps
    end
  end
end
