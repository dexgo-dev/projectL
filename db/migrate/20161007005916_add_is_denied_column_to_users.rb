class AddIsDeniedColumnToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :isDenied, :boolean
  end
end
