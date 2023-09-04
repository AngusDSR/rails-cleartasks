require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "validations" do
    it "validates that task has a name" do
      task = Task.new(content: "Sample content", importance: 3, due_date: Date.tomorrow)
      expect(task.valid?).to be(false)
      expect(task.errors[:name]).to include("can't be blank")
    end

    it "validates that name is longer than 3 characters" do
      task = Task.new(name: "ABC", content: "Sample content", importance: 3, due_date: Date.tomorrow)
      expect(task.valid?).to be(false)
      # expect(task.errors[:name]).to include("is too short (minimum is 4 characters)")
    end

    it "validates that task name is a string" do
      task = Task.new(name: 123, content: "Sample content", importance: 3, due_date: Date.tomorrow)
      task_array = Task.new(name: %w[1 2 3], content: "Sample content", importance: 3, due_date: Date.tomorrow)
      task_hash = Task.new(name: { a: 1, b: 2, c: 3 }, content: "Sample content", importance: 3, due_date: Date.tomorrow)
      expect(task.valid?).to be(false)
      expect(task_array.valid?).to be(false)
      expect(task_hash.valid?).to be(false)
    end

    it "validates that due date is in the future" do
      task = Task.new(content: "Sample content", importance: 3, due_date: Date.yesterday)
      task.valid?
      # expect(task.errors[:due_date]).to include("can't be in the past")
    end

    it "can't have more than 10 subtasks" do
      task = Task.new(name: "Sample name", content: "Sample content", importance: 3, due_date: Date.tomorrow)
      11.times do
        task.subtasks.build(content: "Sample subtask")
      end
      expect(task.valid?).to be(false)
    end

    it "name has 4-15 characters long" do
      task1 = Task.new(name: "New", content: "Sample content", importance: 3, due_date: Date.tomorrow)
      task2 = Task.new(name: "New sample name which is too long", content: "Sample content", importance: 3, due_date: Date.tomorrow)

      expect(task1.valid?).to be(false)
      expect(task2.valid?).to be(false)
      # expect(task1.errors[:name]).to include("is too short (minimum is 4 characters)")
      # expect(task2.errors[:name]).to include("is too long (maximum is 15 characters)")
    end

    it "must have content and the content must have 10-150 characters" do
      task1 = Task.new(name: "New", content: "", importance: 3, due_date: Date.tomorrow)
      task2 = Task.new(name: "New", content: "Too short", importance: 3, due_date: Date.tomorrow)

      expect(task1.valid?).to be(false)
      expect(task2.valid?).to be(false)

        # Check for errors on task1 and task2
        # expect(task1.errors[:content]).to include("can't be blank")
        # expect(task2.errors[:content]).to include("is too short (minimum is 10 characters)")
      # expect(flash[:error]).to include("Enter at least 10 characters")
    end
  end

  describe 'process and quality' do
    let(:task) do
      task = Task.new(name: "Sample name", content: "Sample content", importance: 3, due_date: Date.tomorrow)
      11.times do
        task.subtasks.build(content: "Sample subtask", completion: false)
      end
      task
    end

    it 'is not completed when subtasks are incomplete' do
      task.subtasks.first.update(completion: false)

      expect(task.completion?).to be(false)
    end
  end

  describe "CRUD actions" do
    it 'destroy task' do
      task = Task.new(name: "Sample name", content: "Sample content", importance: 3, due_date: Date.tomorrow)
      task.destroy

      expect(Task.exists?(task.id)).to be(false)
    end
  end



  describe "associations" do
    it "saves subtask to task" do
      task = Task.new(name: "Sample name", content: "Sample content", importance: 3, due_date: Date.tomorrow)
      subtask = Subtask.new(content: "Subtask A", task: task)
      subtask.save
      expect(task.subtasks.count).to eq(1)
      expect(task.subtasks).to_not be_empty
    end
  end
end
