class AddListTitleToLists < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :list_title, :string
  end
end
