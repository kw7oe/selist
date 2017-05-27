class CreateTaskStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :task_statuses, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :task, index: true
      t.timestamps
    end
  end
end
