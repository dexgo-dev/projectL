json.extract! study, :id, :study_name, :description, :created_at, :updated_at
json.url study_url(study, format: :json)