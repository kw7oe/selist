class AddSubjectTitleToSubjects < ActiveRecord::Migration[5.0]
  def change
    add_column :subjects, :title, :string
  end
end
