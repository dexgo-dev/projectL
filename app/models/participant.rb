class Participant < ApplicationRecord
  has_many :notes
  has_many :users, through: :notes
  belongs_to :study

  enum gender: ['Male','Female','Others','Unspecified']

  scope :recently_contacted, -> {
    order("last_contacted_at desc").distinct.limit(10)
  }

  validates :first_name, presence: true
  validates :surname, presence: true
  validates :email, presence: true, :format => EMAIL_REGEX
  validates :active, exclusion: { in: [nil] }
  #validates :gender, presence: true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |participant|
        csv << participant.attributes.values_at(*column_names)
      end
    end
  end
end
