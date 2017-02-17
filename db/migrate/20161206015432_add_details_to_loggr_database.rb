class AddDetailsToLoggrDatabase < ActiveRecord::Migration[5.0]
  def change
  	add_column :participants, :participants_blinders_id, :string
  	add_column :participants, :recruitment_method, :string

  	rename_column :participants, :name, :first_name
  	add_column :participants, :surname, :string
  	add_column :participants, :preferred_name, :string
  	add_column :participants, :title, :string

  	rename_column :participants, :home_address, :home_address_line_1
  	add_column :participants, :home_address_line_2, :string
  	add_column :participants, :home_address_suburb, :string
  	add_column :participants, :home_address_state, :string
  	add_column :participants, :home_address_postcode, :string

  	add_column :participants, :mailing_address_line_1, :string
  	add_column :participants, :mailing_address_line_2, :string
  	add_column :participants, :mailing_address_suburb, :string
  	add_column :participants, :mailing_address_state, :string
  	add_column :participants, :mailing_address_postcode, :string

  	rename_column :participants, :contact_number, :primary_contact_number
  	add_column :participants, :primary_contact_number_type, :integer # home, mobile, work
  	add_column :participants, :secondary_contact_number, :string
  	add_column :participants, :secondary_contact_number_type, :integer # home, mobile, work

  	rename_column :participants, :active, :status
  	change_column :participants, :status, :integer # interested, recruited, included, withdrawn, excluded, completed

  	add_column :participants, :screening_document_id, :integer

	add_column :notes, :assign_notification_to, :integer # user_id

	remove_column :users, :blinded 

	add_column :studies, :study_list, :integer
  end
end
