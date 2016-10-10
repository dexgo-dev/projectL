class User < ApplicationRecord
  has_many :members, class_name: "User", foreign_key: "supervisor_id"
  has_many :notes
  has_many :participants, through: :notes

  belongs_to :team
  belongs_to :supervisor, class_name: "User", optional: true

  validates :email, presence: true, uniqueness: true, :format => EMAIL_REGEX
  validates :password, presence: true, confirmation: true
  validates :contact_number, presence: true
  validates :full_name, presence: true
  validates :team_id, presence: true, numericality: true

  #validates :isActive, inclusion: { in: [true, false] }
  #validates :isApproved, inclusion: { in: [true, false] }
  #validates :isAdmin, inclusion: { in: [true, false] }
  #validates :isDenied, inclusion: { in: [true, false] }
  validates :isSupervisor, inclusion: { in: [true, false] }

  after_initialize :init

  private
    def init
    # Set initial values - they are always false since the admins will change their values via the approval.
        if self.isActive .nil?
          self.isActive = false
        end
        if self.isApproved.nil?
          self.isApproved = false
        end
        if self.isAdmin.nil?
          self.isAdmin = false
        end
        if self.isDenied.nil?
          self.isDenied = false
        end
    end
end
