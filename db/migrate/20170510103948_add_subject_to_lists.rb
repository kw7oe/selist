class AddSubjectToLists < ActiveRecord::Migration[5.0]
  def change
    add_reference :lists, :subject, foreign_key: true
  end
end
