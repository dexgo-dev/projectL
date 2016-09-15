class User < ApplicationRecord
  has_many :participants
  has_many :notes

  validates :contact_number, presence: true
  validates :username, presence: true
  validates :email, presence: true
  validates :full_name, presence: true
  validates :password, presence: true
  validates :supervisor_id, presence: true, numericality: true
  validates :team_id, presence: true, numericality: true
end
