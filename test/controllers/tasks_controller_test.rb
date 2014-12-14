require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @task1 = tasks(:one)
    @task2 = tasks(:two)
    @list = lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
    assert_template 'tasks/index'
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template 'tasks/new'
  end

  test "should create task" do
    assert_difference('Task.count') do
      post :create, task: { done: @task1.done, list_id: @task1.list_id, name: @task1.name }
    end

    assert_redirected_to task_path(assigns(:task))
  end

  test "should not create task(invalid list)" do
    assert_no_difference('Task.count') do
      post :create, task: { done: @task2.done, list_id: @task2.list_id, name: @task2.name }
    end

    assert_response :success
    assert_template 'tasks/new'
  end

  test "should not create task(empty name and list)" do
    assert_no_difference('Task.count') do
      post :create, task: { name: '  ' }
    end

    assert_response :success
    assert_template 'tasks/new'
  end

  test "should show task" do
    get :show, id: @task1
    assert_response :success
    assert_template 'tasks/show'
  end

  test "should get edit" do
    get :edit, id: @task1
    assert_response :success
    assert_template 'tasks/edit'
  end

  test "should update task" do
    patch :update, id: @task1, task: { done: @task1.done, list_id: @task1.list_id, name: @task1.name }
    assert_redirected_to task_path(assigns(:task))
  end

  test "should not update task" do
    patch :update, id: @task1, task: { done: @task2.done, list_id: @task2.list_id, name: @task2.name }

    assert_response :success
    assert_template 'tasks/edit'
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task1
    end

    assert_redirected_to tasks_path
  end
end
