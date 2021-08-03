require 'test_helper'

class Task::ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_list = Task::List.create(name: 'foo')
    @task_item = Task::Item.create(list: @task_list, title: 'foo', body: 'bar', due: 5)
  end

  test 'should get index' do
    get task_list_items_path(@task_list)
    assert_response :success
  end

  test 'should get new' do
    get new_task_list_item_path(@task_list)
    assert_response :success
  end

  test 'should create task item' do
    assert_difference('Task::Item.count', 1) do
      post task_list_items_path(@task_list),
           params: { task_item: { list_id: @task_list.id, title: 'foo2', body: 'bar', due: 1 } }
    end

    assert_redirected_to task_list_path(@task_list)
  end

  test 'should not create task item when invalid' do
    assert_no_difference('Task::Item.count') do
      post task_list_items_path(@task_list), params: { task_item: { title: '', body: 'bar' } }
    end
  end

  test 'should show task item' do
    get task_list_item_url(@task_list, @task_item)
    assert_response :success
  end

  test 'should get edit' do
    get edit_task_list_item_url(@task_list, id: @task_item)
    assert_response :success
  end

  test 'should update task item' do
    patch task_list_item_url(@task_list, @task_item),
          params: { task_item: { title: 'abc', body: 'def', due: 7 } }
    assert_redirected_to task_list_path(@task_list)
  end

  test 'should destroy task item' do
    assert_difference('Task::Item.count', -1) do
      delete task_list_item_url(@task_list, @task_item)
    end

    assert_redirected_to task_list_path(@task_list)
  end
end
