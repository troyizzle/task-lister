require "test_helper"

class Patients::Task::ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patients_task_item = patients_task_items(:one)
  end

  test "should get index" do
    get patients_task_items_url
    assert_response :success
  end

  test "should get new" do
    get new_patients_task_item_url
    assert_response :success
  end

  test "should create patients_task_item" do
    assert_difference('Patients::Task::Item.count') do
      post patients_task_items_url, params: { patients_task_item: {  } }
    end

    assert_redirected_to patients_task_item_url(Patients::Task::Item.last)
  end

  test "should show patients_task_item" do
    get patients_task_item_url(@patients_task_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_patients_task_item_url(@patients_task_item)
    assert_response :success
  end

  test "should update patients_task_item" do
    patch patients_task_item_url(@patients_task_item), params: { patients_task_item: {  } }
    assert_redirected_to patients_task_item_url(@patients_task_item)
  end

  test "should destroy patients_task_item" do
    assert_difference('Patients::Task::Item.count', -1) do
      delete patients_task_item_url(@patients_task_item)
    end

    assert_redirected_to patients_task_items_url
  end
end
