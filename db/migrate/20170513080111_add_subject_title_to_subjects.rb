class AddSubjectTitleToSubjects < ActiveRecord::Migration[5.0]
  def change
    add_column :subjects, :subject_title, :string
  end
end
