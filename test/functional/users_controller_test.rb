require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "get index ajax" do
    xhr :get, :index
    assert_response :success
    assert_not_nil assigns(:users)
    assert_template :layout => nil
  end

  test "get new ajax" do
    xhr :get, :new
    assert_response :success
    assert_not_nil assigns(:user)
    assert_template :layout => nil, :partial => "users/_form"
  end

  test "get edit ajax" do
    xhr :get, :edit, :id => "298486374"
    assert_response :success
    assert_not_nil assigns(:user)
    assert_template :layout => nil, :partial => "users/_form"
  end

  test "get ahow ajax" do
    xhr :get, :show, :id => "298486374"
    assert_response :success
    assert_not_nil assigns(:user)
    assert_template :layout => nil, :action => :user_item
  end

  test "should update user" do
    prev_user = User.find(298486374)
    xhr :put, :update, :id => prev_user.id, :name => "name test 1", :last_name => "last name test 1"
    update_user = assigns(:user)

    assert_response :success
    assert_not_nil update_user
    assert_equal prev_user,update_user

  end

  test "should create user" do
    xhr :post, :create, :user => {:name => "name test 2", :last_name => "last name test 2" }

    assert_response :success
    assert_not_nil assigns(:user)

    json_response = JSON.parse(@response.body)
    assert_equal "false", json_response["error"], "Problem, didn't create user"

  end

    test "should destroy a user" do

    id = "298486374"
    xhr :delete, :destroy, :id => id

    assert_response :success
    deleted_user = User.where(:id => id).count
    assert_equal deleted_user,0
   
  end

end
