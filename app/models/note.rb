class Note < ApplicationRecord
  belongs_to :participant
  belongs_to :user

  validates :note_text, presence: true
  validates :important, inclusion: { in: [true, false] }
  validates :notify, inclusion: { in: [true, false] }
  #validates :participant_id, presence: true
  #validates :user_id, presence: true

  before_validation :set_notification

  scope :recent_ten, -> {
    order("updated_at desc").limit(10)
  }

  scope :upcoming_notifications_this_week, -> {
    where(:notify_on => Date.today.beginning_of_week..Date.today.end_of_week).order(:notify_on)
  }

  # Maximum notes per page.
  self.per_page = 10

  private

  def note_notifier_notification
    NotifierMailer.note_notifier(self).deliver
  end

  def set_notification
    unless self.notify?
      self.notify_on = nil
    end
  end
end
