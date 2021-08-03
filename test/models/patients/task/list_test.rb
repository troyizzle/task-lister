require 'test_helper'

class Patients::Task::ListTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:patient).class_name('Patient')
    should belong_to(:list).class_name('::Task::List')
    should have_many(:items).class_name('::Patients::Task::Item')
  end

  context 'validations' do
    should validate_presence_of(:start_date)
  end
end
