class CreateSubtasks < ActiveRecord::Migration[7.0]
  def change
    create_table :subtasks do |t|
      t.string :content
      t.boolean :completion, default: false
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
