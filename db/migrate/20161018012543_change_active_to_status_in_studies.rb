class ChangeActiveToStatusInStudies < ActiveRecord::Migration[5.0]
  def change
  	rename_column :studies, :active, :status
  	change_column :studies, :status, :integer
  end
end
