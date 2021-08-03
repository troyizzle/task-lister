# frozen_string_literal: true

class Patient < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_one :task_list, class_name: '::Patients::Task::List'
  accepts_nested_attributes_for :task_list

  has_many :task_items, through: :task_list,
                        source: :items, class_name: '::Patients::Task::Item'

  def full_name
    "#{first_name} #{last_name}"
  end
end
