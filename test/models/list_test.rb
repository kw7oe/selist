require 'test_helper'

class ListTest < ActiveSupport::TestCase
  
  def setup
    @list = List.new(title: "List 1")
  end

  # test "should be valid" do 
  #   assert @list.valid?
  # end

  test "subject should not be blank" do 
    @list.subject = nil 
    assert_not @list.valid?
  end

  test "title should not be blank" do 
    @list.title = "     "
    assert_not @list.valid?
  end

end
