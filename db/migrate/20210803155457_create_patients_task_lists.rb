class CreatePatientsTaskLists < ActiveRecord::Migration[6.1]
  def change
    create_table :patients_task_lists do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: { to_table: :task_lists }
      t.datetime :start_date
      t.timestamps
    end
  end
end
