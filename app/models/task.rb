class Task < ApplicationRecord
  has_many :subtasks

  # callbacks
  after_initialize :set_task_content_original
  after_commit :update_task_log

  validates :content, presence: true, allow_nil: false, length: { in: 10..150 }

  # validates :name, presence: true, uniqueness: true, length: { in: 10..150 }
  # validates :importance, numericality: { less_than: 4 }
  # validates :difficulty, numericality: { less_than: 4 }
  # validate :due_date_must_be_in_future

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

  def update_task_log
    subtasks = []
    File.open(Rails.public_path.join('task_log.txt'), 'w') do |file|
      Task.all.order('due_date DESC, importance').each do |record|
        subtasks << record.subtasks.each(&:name)
        # file.write("#{record.name}, #{record.reason}, by #{record.due_date}\n#{subtasks.join('\n-') if subtasks.any?}")
        file.write("#{record.name}, #{record.reason}, by #{record.due_date}\n")
      end
    end
  end
end
