class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.text :content
      t.string :name
      t.date :due_date
      t.integer :importance, default: 1
      t.string :reason
      t.boolean :completion, default: false
      t.text :content_original

      t.timestamps
    end
  end
end
