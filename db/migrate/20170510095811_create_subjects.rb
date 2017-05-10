class CreateSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|

      t.timestamps
    end


    create_table :subjects_users, id: false do |t|
      t.belongs_to :subject, index: true
      t.belongs_to :user, index: true
    end
  end
end
