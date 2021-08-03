require 'test_helper'

class Task::ItemTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:list).class_name('Task::List')
  end

  context 'validations' do
    should validate_presence_of(:title)
    should validate_presence_of(:body)
    should validate_presence_of(:due)
  end
end
