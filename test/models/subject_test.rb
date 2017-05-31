require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  
  def setup
    @subject = Subject.new(title: "Title")
  end

  test "should be valid" do 
    assert @subject.valid?
  end

  test "title should not be blank" do 
    @subject.title = "     "
    assert_not @subject.valid?
  end
  
end
