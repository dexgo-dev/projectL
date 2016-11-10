class Note < ApplicationRecord
  belongs_to :participant
  belongs_to :user

  validates :note_text, presence: true
  validates :important, inclusion: { in: [true, false] }
  validates :notify, inclusion: { in: [true, false] }
  #validates :participant_id, presence: true
  #validates :user_id, presence: true

  before_save :set_doneOn, if: :isDone_changed?
  before_validation :set_notification

  scope :recent_ten, -> {
    order("updated_at desc").limit(10)
  }

  scope :upcoming_notifications_this_week, -> {
    where(notify: true).where(:notify_on => Date.today.beginning_of_week..Date.today.end_of_week).order(:notify_on)
  }

  scope :upcoming_notifications_this_fortnight, -> {
    where(notify: true).where(:notify_on => Date.today.beginning_of_week..Date.today.end_of_week + 7).order(:notify_on)
  }

  scope :upcoming_notifications_this_month, -> {
    where(notify: true).where(:notify_on => Date.today.beginning_of_month..Date.today.end_of_month).order(:notify_on)
  }

  scope :major, -> {
    where(important: true)
  }

  # Maximum notes per page.
  self.per_page = 10

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |note|
        csv << note.attributes.values_at(*column_names)
      end
    end
  end

  private

  def note_notifier_notification
    NotifierMailer.note_notifier(self).deliver
  end

  def set_notification
    unless self.notify?
      self.notify_on = nil
    end
  end

  def set_doneOn
    if self.isDone?
      self.doneOn = DateTime.now
    else
      self.doneOn = nil
      self.doneBy = nil
    end
  end
end
