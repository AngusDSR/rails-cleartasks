class Task < ApplicationRecord
  has_many :subtasks

  after_initialize :set_task_content_original
  validates :task_name, presence: true, uniqueness: true, length: { in: 15..150 }
  validates :task_importance, less_than: 4
  validates :task_difficulty, less_than: 4

  private

  def set_task_content_original
    self.task_content_original = task_content
  end
end
