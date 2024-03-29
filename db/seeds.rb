Task.destroy_all

4.times do |i|
  num = i + 1
  puts "Creating #{num.ordinalize} task"
  Task.create!(
    content: "test content ##{num}",
    name: "test name ##{num}",
    due_date: "2023-04-#{rand(31)}",
    importance: rand(3),
    reason: "test reason ##{num}"
  )
end

Task.all.each do |task|
  task.subtasks
end

p Task.all
