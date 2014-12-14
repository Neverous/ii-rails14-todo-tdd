require 'test_helper'

class TaskManipulationTest < ActionDispatch::IntegrationTest
    test 'create new and remove list with existing tasks' do
        get '/'
        assert_response :success
        assert_template 'lists/index'
        assert assigns(:lists).count == 2

        get '/lists/new'
        assert_response :success
        assert_template 'lists/new'

        post_via_redirect '/lists', list: {name: 'Test List'}
        list = assigns(:list)
        assert list
        assert_response :success
        assert_template 'lists/show'

        get '/'
        assert_response :success
        assert_template 'lists/index'
        assert assigns(:lists).count == 3

        get '/tasks'
        assert_response :success
        assert_template 'tasks/index'
        assert assigns(:tasks).count == 2

        get '/tasks/new'
        assert_response :success
        assert_template 'tasks/new'

        post_via_redirect '/tasks', task: {name: 'Invalid'}
        assert_response :success
        assert_template 'tasks/new'

        post_via_redirect '/tasks', task: {name: 'Test task', list_id: list.id}
        task = assigns(:task)
        assert task
        assert_response :success
        assert_template 'tasks/show'

        get '/tasks'
        assert_response :success
        assert_template 'tasks/index'
        assert assigns(:tasks).count == 3

        delete_via_redirect '/lists/' + list.id.to_s
        assert_response :success
        assert_template 'lists/index'

        get '/'
        assert_response :success
        assert_template 'lists/index'
        assert assigns(:lists).count == 2

        get '/tasks'
        assert_response :success
        assert_template 'tasks/index'
        assert assigns(:tasks).count == 2
    end
end
