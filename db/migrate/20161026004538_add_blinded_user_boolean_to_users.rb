class AddBlindedUserBooleanToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :isBlinded, :boolean
  end
end
