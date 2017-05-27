require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(email: "user@example.com", type: "Student",
                     password: "password", password_confirmation: "password")
  end

  test "should be valid" do 
    assert @user.valid?
  end

  test "email should not be blank" do 
    @user.email = "     "
    assert_not @user.valid?
  end

  test "email should not be too long" do 
    @user.email = "a" * 251
    assert_not @user.valid?
  end

  test "email validation should reject invalid email" do 
    invalid_email_address = %w{ user@example,com user_at_foo.org 
        user.name@example. foo@bar_baz.com foo@bar+bax.com }
    invalid_email_address.each do |invalid_email|
      @user.email = invalid_email
      assert_not @user.valid?
    end
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email should be save as lower-case" do
    mixed_case_email =  "FooBar@example.com"
    @user.email = mixed_case_email
    @user.save 
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should not be blank" do 
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should be at least 6 characters" do 
    @user.password = @user.password_confirmation = "a"
    assert_not @user.valid?
  end

end
