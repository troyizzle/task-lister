require 'test_helper'

class Task::ListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_list = Task::List.create(name: 'foo')
  end

  test 'should get index' do
    get task_lists_path
    assert_response :success
  end

  test 'should get new' do
    get new_task_list_path
    assert_response :success
  end

  test 'should create task list' do
    assert_difference('Task::List.count', 1) do
      post task_lists_path,
           params: { task_list: { name: 'foo2' } }
    end

    assert_redirected_to task_list_path(Task::List.last)
  end

  test 'should not create task list when invalid' do
    assert_no_difference('Task::List.count') do
      post task_lists_path, params: { task_list: { name: '' } }
    end
  end

  test 'should show task list' do
    get task_list_url(@task_list)
    assert_response :success
  end

  test 'should get edit' do
    get edit_task_list_url(@task_list)
    assert_response :success
  end

  test 'should update task item' do
    patch task_list_url(@task_list),
          params: { task_list: { name: 'foo3' } }
    assert_redirected_to task_list_path(@task_list)
  end

  test 'should destroy task item' do
    assert_difference('Task::List.count', -1) do
      delete task_list_url(@task_list)
    end

    assert_redirected_to task_lists_path
  end
end
