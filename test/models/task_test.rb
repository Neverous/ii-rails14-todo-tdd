require 'test_helper'

class TaskTest < ActiveSupport::TestCase
    test 'task requires name' do
        list = List.new()
        task1 = Task.new()
        task2 = Task.new(done: true)
        task3 = Task.new(list: list)
        assert_not task1.valid? || task2.valid? || task3.valid?, 'Name is required'
    end

    test 'task requires list' do
        task = Task.new(name: 'test')
        assert_not task.valid?, 'List is required'
    end

    test 'list should exist' do
        task = Task.new(name: 'TestList', done: false, list_id: 777)
        assert_not task.valid?, 'Valid list is required'
    end

    test 'valid task' do
        list = List.new(name: 'ListTest')
        task = Task.new(name: 'TaskTest', done: false, list: list)
        assert task.valid?, 'Name and list are only required fields'
    end
end
