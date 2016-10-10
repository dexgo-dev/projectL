class Team < ApplicationRecord
	has_many :users

	#validates :group_email, presence: false, :format => EMAIL_REGEX
end
