require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  
  def setup
    @subject = Subject.new(title: "Subject 1")
  end

  test "title should not be blank" do 
    @subject.title = "     "
    assert_not @subject.valid?
  end
  
end
