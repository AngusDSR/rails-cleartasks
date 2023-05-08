class Subtask < ApplicationRecord
  belongs_to :task
  validates :content, presence: true, uniqueness: true, allow_nil: false, length: { in: 5..50 }
end
