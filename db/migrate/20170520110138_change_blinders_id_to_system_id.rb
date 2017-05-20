class ChangeBlindersIdToSystemId < ActiveRecord::Migration[5.0]
  def change
  	unless column_exists? :participants, :participants_system_id
    	rename_column :participants, :participants_blinders_id, :participants_system_id
    end
  end
end
