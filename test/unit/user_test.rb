require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "new user without name and last name" do
    user = User.new
    assert !user.save, "Saved without name & last_name"
  end

  test "new user with name and last name" do
    user = User.new
    user.name = "name 1 test"
    user.last_name = "last name 1 test"
    assert user.save, "Saved correctry"
  end

end
