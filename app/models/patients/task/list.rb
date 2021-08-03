class Patients::Task::List < ApplicationRecord
  belongs_to :patient
  belongs_to :list, class_name: '::Task::List'

  has_many :items

  accepts_nested_attributes_for :items

  validates :start_date, presence: true

  def all_tasks_complete?
    items.where(completed_date: nil).count.zero?
  end
end
