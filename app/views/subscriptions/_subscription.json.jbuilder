json.extract! subscription, :id, :user_id, :study_id, :visbility, :status, :comment, :valid_until, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)