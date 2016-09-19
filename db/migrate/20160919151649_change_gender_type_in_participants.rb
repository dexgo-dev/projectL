class ChangeGenderTypeInParticipants < ActiveRecord::Migration[5.0]
  def change
    change_column :participants, :gender, :integer
  end
end
