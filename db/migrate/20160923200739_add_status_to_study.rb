class AddStatusToStudy < ActiveRecord::Migration[5.0]
  def change
  	add_column :studies, :status, :integer
  end
end
