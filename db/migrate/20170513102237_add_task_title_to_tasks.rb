class AddTaskTitleToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :task_title, :string
  end
end
