class RemoveUsernameFromUsers < ActiveRecord::Migration[5.0]
  def change
  	if column_exists? :users, :user_name
  		remove_column :users, :user_name
  	end
  end
end
