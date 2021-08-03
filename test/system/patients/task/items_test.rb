require "application_system_test_case"

class Patients::Task::ItemsTest < ApplicationSystemTestCase
  setup do
    @patients_task_item = patients_task_items(:one)
  end

  test "visiting the index" do
    visit patients_task_items_url
    assert_selector "h1", text: "Patients/Task/Items"
  end

  test "creating a Item" do
    visit patients_task_items_url
    click_on "New Patients/Task/Item"

    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "Back"
  end

  test "updating a Item" do
    visit patients_task_items_url
    click_on "Edit", match: :first

    click_on "Update Item"

    assert_text "Item was successfully updated"
    click_on "Back"
  end

  test "destroying a Item" do
    visit patients_task_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item was successfully destroyed"
  end
end
