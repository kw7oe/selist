require 'test_helper'

class ListTest < ActiveSupport::TestCase
  
  def setup
    @list = List.new(title: "List 1")
  end

  test "title should not be blank" do 
    @list.title = "     "
    assert_not @list.valid?
  end

end
