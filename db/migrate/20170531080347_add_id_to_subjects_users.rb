class AddIdToSubjectsUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :subjects_users, :id, :primary_key
  end
end
