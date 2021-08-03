# frozen_string_literal: true

module PatientsHelper
  def task_action_date(task)
    return "Completed: #{format_date(task.completed_date)}" if task.completed_date

    "Due #{format_date(task.due_date)}"
  end

  def task_overdue_flag?(task)
    return if task.completed?

    task.overdue?
  end

  private

  def format_date(date)
    date.strftime('%m/%d/%y')
  end
end
