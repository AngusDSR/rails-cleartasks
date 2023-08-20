class Task < ApplicationRecord
  has_many :subtasks, dependent: :destroy

  # callbacks
  after_initialize :set_task_content_original
  before_save :set_priority
  after_commit :update_task_log
  validates :content, presence: true, length: { in: 10..150 }
  validates :importance, numericality: { less_than: 6, greater_than: 0 }
  validate :due_date_must_be_in_future

  private

  def set_task_content_original
    # take a copy of the original task content - in case we change it with GPT
    self.content_original = content
  end

  def due_date_must_be_in_future
    # allow nil values, only valid if there IS a date entered
    return if due_date.nil?

    errors.add(:due_date, "can't be in the past") unless due_date >= Date.today
  end

  def set_priority
    # set priority based on due date and count of subtasks
    puts priority
    puts " ****** SETTING PRIORITY ****** "
    puts " ****** Setting priority ****** "
    puts " ****** Setting priority ****** "
    puts " ****** Setting priority ****** "
    time_factor = due_date ? 1.0 / (due_date - Date.today).to_i : 1

    self.priority = (subtasks.count + 1) * importance * time_factor
    puts " ****** st COUNT: #{subtasks.count + 1}  IMPORTANCE: #{importance} * TIME:#{time_factor}} ****** "
    puts " ****** priority: #{priority} ****** "
  end

  def update_task_log
    puts " ****** UPDATE TASK LOG ****** "
    subtasks = []
    File.open(Rails.public_path.join('task_log.txt'), 'w') do |file|
      Task.all.order('due_date DESC, importance').each do |record|
        subtasks << record.subtasks.each(&:content)
        # file.write("#{record.name}, #{record.reason}, by #{record.due_date}\n#{subtasks.join('\n-') if subtasks.any?}")
        file.write("#{record.name}, #{record.reason}, by #{record.due_date}\n")
      end
    end
  end
end
