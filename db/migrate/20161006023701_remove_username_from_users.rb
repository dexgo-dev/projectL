class RemoveUsernameFromUsers < ActiveRecord::Migration[5.0]
  def change
  	if column_exists? :users, :username
  		remove_column :users, :username
  	end
  end
end
