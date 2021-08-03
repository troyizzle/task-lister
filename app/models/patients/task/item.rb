# frozen_string_literal: true

class Patients::Task::Item < ApplicationRecord
  belongs_to :list
  belongs_to :item, class_name: '::Task::Item'

  delegate :title, to: :item
  delegate :body, to: :item

  after_create :set_due_date

  def completed?
    completed_date.present?
  end

  def overdue?
    due_date < Time.now
  end

  private

  def set_due_date
    update(due_date: list.start_date + item.due.days)
  end
end
