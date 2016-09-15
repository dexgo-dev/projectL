class CreateStudies < ActiveRecord::Migration[5.0]
  def change
    create_table :studies do |t|
      t.text :description
      t.string :study_name

      t.timestamps
    end
  end
end
