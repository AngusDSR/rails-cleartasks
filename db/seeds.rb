Task.destroy_all

test_task = Task.new(
  task_content: "test content",
  task_name: "test name",
  task_due_date: "2022-02-02",
  task_importance: 1,
  task_reason: "test reason",
  task_contact: "test contact"
  # task_completion: false
)

4.times do |i|
  num = i + 1
  puts "Creating #{num.ordinalize} task"
  Task.create(
    task_content: "test content ##{num}",
    task_name: "test name ##{num}",
    task_due_date: "2022-02-#{num}",
    task_importance: i,
    task_reason: "test reason ##{num}",
    task_contact: "test contact ##{num}"
  )
end

p Task.all
