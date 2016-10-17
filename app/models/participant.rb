class Participant < ApplicationRecord
  has_many :notes
  has_many :users, through: :notes
  belongs_to :study

  enum gender: ['Male','Female','Others','Unspecified']

  scope :recently_contacted, -> {
    order("last_contacted_at desc").distinct.limit(10)
  }

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, :format => EMAIL_REGEX
  validates :active, exclusion: { in: [nil] }
  #validates :gender, presence: true

  def self.search search, study, user
	  if search
      if study != 0
        where('name LIKE ?', "%#{search}%").where(study_id: study).distinct
      else
        where('name LIKE ?', "%#{search}%").distinct
      end
	  else
	      #where('last_contacted_by = user.id')
        if study != 0
	       joins(:users).where(last_contacted_by: user).recently_contacted.where(study_id: study)
        else
         joins(:users).where(last_contacted_by: user).recently_contacted
        end
	  end
    

  end
end
