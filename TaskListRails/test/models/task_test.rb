require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "can create a valid task" do
    assert tasks(:post_office).valid?
  end

  test "cannot create a task with missing information" do
    assert_not tasks(:missing_info).valid?
    assert_includes tasks(:missing_info).errors, :name
    assert_includes tasks(:missing_info).errors, :user_id
  end

  test "cannot create a task without a name" do
    assert_not tasks(:no_name).valid?
    assert_includes tasks(:no_name).errors, :name
  end

  test "cannot create a task with no user_id" do
    assert_not tasks(:no_user_id).valid?
    assert_includes tasks(:no_user_id).errors, :user_id
  end

end
