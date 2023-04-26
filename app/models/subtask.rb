class Subtask < ApplicationRecord
  belongs_to :task
  validates :content, presence: true, uniqueness: true, length: { in: 10..150 }

  # def self.create_new(content, task_id)
  #   subtask = Subtask.new(content: content, task_id: task_id)
  #   if subtask.save
  #     return subtask
  #   else
  #     return nil
  #   end
  # end
end
