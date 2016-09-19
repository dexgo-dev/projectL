class User < ApplicationRecord
  has_many :members, class_name: "User", foreign_key: "supervisor_id"
  has_many :participants
  has_many :notes

  belongs_to :supervisor, class_name: "User", optional: true

  validates :contact_number, presence: true
  validates :username, presence: true
  validates :email, presence: true
  validates :full_name, presence: true
  validates :password, presence: true
  validates :team_id, presence: true, numericality: true
end
