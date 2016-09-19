json.extract! user, :id, :username, :password, :full_name, :email, :contact_number, :team_id, :supervisor_id, :created_at, :updated_at
json.url user_url(user, format: :json)