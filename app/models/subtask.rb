class Subtask < ApplicationRecord
  belongs_to :task
  validates :subtask_content, presence: true, uniqueness: true, length: { in: 15..150 }
end
