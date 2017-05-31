require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  
  def setup
    @task = Task.new(title: "Task 1")
  end

  # test "should be valid" do
  #   assert @task.valid? 
  # end

  test "list should not be blank" do 
    @task.list = nil
    assert_not @task.valid?
  end

  test "title should not be blank" do 
    @task.title = "     "
    assert_not @task.valid?
  end
  
end
