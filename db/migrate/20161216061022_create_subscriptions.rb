class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :study_id
      t.integer :visbility
      t.integer :status
      t.text :comment
      t.date :valid_until

      t.timestamps
    end
  end
end
