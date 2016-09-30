module ApplicationHelper
  def datetime_formatter(task)
    if task.completed_at != nil
      return task.completed_at.to_formatted_s(:short)
    end
  end
end
