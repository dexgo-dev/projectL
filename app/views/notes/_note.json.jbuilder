json.extract! note, :id, :participant_id, :note_text, :important, :user_id, :notify_on, :created_at, :updated_at
json.url note_url(note, format: :json)