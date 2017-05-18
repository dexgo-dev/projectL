json.extract! team, :id, :name, :description, :contact_user, :group_email, :created_at, :updated_at
json.url team_url(team, format: :json)