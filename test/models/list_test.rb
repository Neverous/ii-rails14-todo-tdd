require 'test_helper'

class ListTest < ActiveSupport::TestCase
    test "list requires name" do
        list = List.new()
        assert_not list.valid?, "Name is required"
    end

    test 'valid list' do
        list = List.new(name: 'TestList')
        assert list.valid?, 'Name is only required field for list'
    end
end
