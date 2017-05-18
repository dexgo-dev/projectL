class Study < ApplicationRecord
  has_many :participants

  after_initialize :init

  def init
  # Set initial values
  	if self.status.nil?
    	self.status = 1 # For now, let's set 1 to active. We can decide other "states" later.
    end
  end
end
