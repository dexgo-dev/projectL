json.extract! user, :id, :email, :password, :full_name, :contact_number, :team_id, :supervisor_id, :created_at, :updated_at
json.url user_url(user, format: :json)