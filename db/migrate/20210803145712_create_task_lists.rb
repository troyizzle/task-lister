class CreateTaskLists < ActiveRecord::Migration[6.1]
  def change
    create_table :task_lists do |t|
      t.integer :status, default: 0
      t.string :name, default: ''

      t.timestamps
    end
  end
end
