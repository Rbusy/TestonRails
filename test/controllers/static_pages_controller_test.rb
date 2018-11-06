require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  

  def setup
    @user = User.create(first_name:'First', last_name:'Last', email: 'example@example.com', password:'password', password_confirmation: "password")
  end

  test 'not show member without log' do
  get root_path
  assert_select 'a[href=?]', members_path, count:0
end

  #Test views Log in + Private links
  test "login with valid information" do
      get login_path
      post login_path, params: { session: { email: @user.email, password: @user.password } }
      assert_redirected_to root_url
      follow_redirect!
      assert_template root_path
      assert_select "a[href=?]", login_path, count: 0     #navbar
      assert_select "a[href=?]", signup_path, count: 0    #navbar
      assert_select "a[href=?]", members_path, count: 2   #Members list
      assert_select "a[href=?]", logout_path, count: 1    #navbar
    end
end