class Participant < ApplicationRecord
  has_many :notes

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :study_id, presence: true
  validates :active, exclusion: { in: [nil] }
  validates :gender, presence: true
end
