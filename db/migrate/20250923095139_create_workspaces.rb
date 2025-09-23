class CreateWorkspaces < ActiveRecord::Migration[8.0]
  def change
    create_table :workspaces do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :title
      t.timestamps
    end
  end
end
