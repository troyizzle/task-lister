json.extract! patients_task_list, :id, :patient_id, :list_id, :start_date, :created_at, :updated_at
json.url patients_task_list_url(patients_task_list, format: :json)
