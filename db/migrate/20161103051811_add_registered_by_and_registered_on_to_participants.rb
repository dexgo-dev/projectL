class AddRegisteredByAndRegisteredOnToParticipants < ActiveRecord::Migration[5.0]
  def change
  	add_column :participants, :registeredBy, :integer # userID of user who changed this note to done.
  	add_column :participants, :registeredOn, :datetime # date registered
  end
end
