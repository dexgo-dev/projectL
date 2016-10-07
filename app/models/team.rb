class Team < ApplicationRecord
	has_many :users

	validates :email, :format => EMAIL_REGEX
end
