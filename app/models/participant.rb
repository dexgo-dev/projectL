class Participant < ApplicationRecord
  has_many :notes
  has_many :users, through: :notes
  belongs_to :study

  enum gender: ['Male','Female','Others','Unspecified']
  # scope :recently_contacted

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :active, exclusion: { in: [nil] }
  #validates :gender, presence: true
end
