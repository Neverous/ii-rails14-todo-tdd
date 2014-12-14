require 'test_helper'

class ListsControllerTest < ActionController::TestCase
  setup do
    @list = lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lists)
    assert_template 'lists/index'
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template 'lists/new'
  end

  test "should create list" do
    assert_difference('List.count') do
      post :create, list: { name: @list.name }
    end

    assert_redirected_to list_path(assigns(:list))
  end

  test "should not create list(empty name)" do
    assert_no_difference('List.count') do
      post :create, list: { name: '  ' }
    end

    assert_response :success
    assert_template 'lists/new'
  end

  test "should show list" do
    get :show, id: @list
    assert_response :success
    assert_template 'lists/show'
  end

  test "should get edit" do
    get :edit, id: @list
    assert_response :success
    assert_template 'lists/edit'
  end

  test "should update list" do
    patch :update, id: @list, list: { name: @list.name }
    assert_redirected_to list_path(assigns(:list))
  end

  test "should destroy list" do
    assert_difference('List.count', -1) do
      delete :destroy, id: @list
    end

    assert_redirected_to lists_path
  end
end
