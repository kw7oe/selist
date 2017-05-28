require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  
  def setup
    @task = Task.new(title: "Task 1")
  end

  test "title should not be blank" do 
    @task.title = "     "
    assert_not @task.valid?
  end
  
end
