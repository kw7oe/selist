class AddSubjectToResources < ActiveRecord::Migration[5.0]
  def change
    add_reference :resources, :subject, foreign_key: true
  end
end
