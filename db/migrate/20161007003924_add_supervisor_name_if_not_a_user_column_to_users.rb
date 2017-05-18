class AddSupervisorNameIfNotAUserColumnToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :supervisorNameNotAUser, :string
  end
end
