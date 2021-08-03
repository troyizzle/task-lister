class CreateTaskItems < ActiveRecord::Migration[6.1]
  def change
    create_table :task_items do |t|
      t.string :title, default: ''
      t.string :body, default: ''
      t.integer :due, default: 0
      t.integer :status, default: 0
      t.references :list, null: false, foreign_key: { to_table: :task_lists }

      t.timestamps
    end
  end
end
