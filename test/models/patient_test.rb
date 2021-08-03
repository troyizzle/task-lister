require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  context 'associations' do
    should have_one(:task_list).class_name('::Patients::Task::List')
    should have_many(:task_items).class_name('::Patients::Task::Item')
  end

  context 'validations' do
    should validate_presence_of(:first_name)
    should validate_presence_of(:last_name)
  end

  def test_full_name
    user = Patient.new(first_name: 'foo', last_name: 'bar')
    assert 'foo bar', user.full_name
  end
end
