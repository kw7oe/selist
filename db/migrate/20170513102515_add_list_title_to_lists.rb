class AddListTitleToLists < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :title, :string
  end
end
