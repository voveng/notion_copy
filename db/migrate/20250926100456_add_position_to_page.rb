class AddPositionToPage < ActiveRecord::Migration[8.0]
  def change
    add_column :pages, :position, :integer, default: 0
  end
end
