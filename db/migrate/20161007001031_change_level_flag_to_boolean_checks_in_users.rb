class ChangeLevelFlagToBooleanChecksInUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :level
  	add_column :users, :isApproved, :boolean
  	add_column :users, :isActive, :boolean
  	add_column :users, :isAdmin, :boolean
  end
end
