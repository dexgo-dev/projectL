class AddIsSupervisorColumnToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :isSupervisor, :boolean
  end
end
