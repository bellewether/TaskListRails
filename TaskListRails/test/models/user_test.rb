require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "can create a valid user" do
    assert users(:one).valid?
  end

  test "cannot create a user with missing information" do
    assert_not users(:missing_info).valid?

    assert_includes users(:missing_info).errors, :email
    # assert_includes users(:missing_info).errors, :uid
    # assert_includes users(:missing_info).errors, :provider
  end

  # test "cannot create a user without a uid" do
  #   assert_not users(:no_uid).valid?
  #   assert_includes users(:no_uid).errors, :uid
  # end

  test "cannot create a user without a email" do
    assert_not users(:email).valid?
    assert_includes users(:email).errors, :email
  end

  # test "cannot create a user without a provider" do
  #   assert_not users(:).valid?
  #   assert_includes user.errors, :provider
  # end

  test "can create a user from github" do
    auth_hash = OmniAuth.config.mock_auth[:github]
    user_gh_built = User.build_from_github(auth_hash)

    assert user_gh_built.valid?
  end

end
