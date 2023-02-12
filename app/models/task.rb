class Task < ApplicationRecord
  after_initialize :set_task_content_original

  private

  def set_task_content_original
    self.task_content_original = task_content
  end
end
