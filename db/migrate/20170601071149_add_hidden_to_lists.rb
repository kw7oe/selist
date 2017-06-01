class AddHiddenToLists < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :is_hidden, :boolean, default: false
  end
end
