class AddLastContactedInfoToParticipants < ActiveRecord::Migration[5.0]
  def change
  	add_column :participants, :last_contacted_by, :integer # user_id
  	add_column :participants, :last_contacted_at, :datetime
  end
end
