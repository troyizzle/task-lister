require 'test_helper'

class Task::ListTest < ActiveSupport::TestCase
  context 'associations' do
    should have_many(:items).class_name('Task::Item')
  end

  context 'validations' do
    should validate_presence_of(:name)
  end
end
