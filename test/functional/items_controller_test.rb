require 'test_helper'

class ItemsControllerTest < ActionController::TestCase

  test "get index ajax" do
    xhr :get, :index
    assert_response :success
    assert_not_nil assigns(:items)
    assert_not_nil assigns(:users_count)
    assert_template :layout => nil
  end

  test "get new ajax" do
    xhr :get, :new
    assert_response :success
    assert_not_nil assigns(:Item)
    assert_not_nil assigns(:users)
    assert_template :layout => nil, :partial => "users/_form"
  end

  test "get edit ajax" do
    xhr :get, :edit, :id => "980190962"
    assert_response :success
    assert_not_nil assigns(:Item)
    assert_not_nil assigns(:users)
    assert_template :layout => nil, :partial => "users/_form"
  end


  test "should update an item" do
    prev_item = Item.find(298486374)
    xhr :put, :update, :id => prev_item.id, :item => {:name => "item test 3", :color => "color test 3", :user_id => "298486374" }
    update_item = assigns(:Item)

    assert_response :success
    assert_not_nil update_item
    assert_equal prev_item,update_item

  end

  test "should create an item" do
    xhr :post, :create, :item => {:name => "item test 2", :color => "color test 2", :user_id => "298486374" }

    assert_response :success
    assert_not_nil assigns(:Item)
  end

  test "should destroy an item" do

    id = "298486374"
    xhr :delete, :destroy, :id => id

    assert_response :success
    deleted_item = Item.where(:id => id).count
    assert_equal deleted_item,0

  end

end
