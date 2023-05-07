class Subtask < ApplicationRecord
  belongs_to :task
  validates :content, presence: true, uniqueness: true, allow_nil: false, length: { in: 10..150 }
end
