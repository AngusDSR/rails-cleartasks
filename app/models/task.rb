class Task < ApplicationRecord
  has_many :subtasks

  after_initialize :set_task_content_original
  validates :name, presence: true, uniqueness: true, length: { in: 10..150 }
  validates :importance, numericality: { less_than: 4 }
  validates :difficulty, numericality: { less_than: 4 }
  validate :due_date_must_be_in_future

  private

  def set_task_content_original
    # take a copy of the original task content - in case we change it with GPT
    self.content_original = content
  end

  def due_date_must_be_in_future
    # allow nil values, only valid if there IS a date entered
    return if due_date.nil?

    errors.add(:due_date.nil, "can't be in the past") unless due_date >= Date.today
  end
end
