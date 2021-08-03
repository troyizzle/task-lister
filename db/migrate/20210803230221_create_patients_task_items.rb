class CreatePatientsTaskItems < ActiveRecord::Migration[6.1]
  def change
    create_table :patients_task_items do |t|
      t.references :list, null: false, foreign_key: { to_table: :patients_task_lists }
      t.references :item, null: false, foreign_key: { to_table: :task_items }
      t.datetime :completed_date
      t.datetime :due_date
      t.timestamps
    end
  end
end
