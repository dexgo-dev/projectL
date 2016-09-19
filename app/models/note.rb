class Note < ApplicationRecord
  belongs_to :participant
  belongs_to :user

  validates :note_text, presence: true
  validates :important, inclusion: { in: [true, false] }
  #validates :participant_id, presence: true
  #validates :user_id, presence: true

  scope :recent_notes, -> {
    order("updated_at desc").limit(10)
  }
end
