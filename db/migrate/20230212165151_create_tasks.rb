class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.text :task_content
      t.string :task_name
      t.date :task_due_date
      t.integer :task_importance, default: 0
      t.integer :task_difficulty, default: 0
      t.string :task_reason
      t.string :task_contact
      t.boolean :task_completion, default: false
      t.text :task_content_original

      t.timestamps
    end
  end
end
