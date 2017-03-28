class AddDetailsToLoggrDatabase < ActiveRecord::Migration[5.0]
  def change
    
  	add_column :participants, :participants_blinders_id, :string unless column_exists? :participants, :participants_blinders_id
    add_column :participants, :recruitment_method, :string unless column_exists? :participants, :recruitment_method

    
  	rename_column :participants, :name, :first_name unless column_exists? :participants, :first_name
    add_column :participants, :surname, :string unless column_exists? :participants, :surname
  	add_column :participants, :preferred_name, :string unless column_exists? :participants, :preferred_name
  	add_column :participants, :title, :string unless column_exists? :participants, :title

  	rename_column :participants, :home_address, :home_address_line_1 unless column_exists? :participants, :home_address_line_1
  	add_column :participants, :home_address_line_2, :string unless column_exists? :participants, :home_address_line_2
  	add_column :participants, :home_address_suburb, :string unless column_exists? :participants, :home_address_suburb
  	add_column :participants, :home_address_state, :string unless column_exists? :participants, :home_address_state
  	add_column :participants, :home_address_postcode, :string unless column_exists? :participants, :home_address_postcode

  	add_column :participants, :mailing_address_line_1, :string unless column_exists? :participants, :mailing_address_line_1
  	add_column :participants, :mailing_address_line_2, :string unless column_exists? :participants, :mailing_address_line_2
  	add_column :participants, :mailing_address_suburb, :string unless column_exists? :participants, :mailing_address_suburb
  	add_column :participants, :mailing_address_state, :string unless column_exists? :participants, :mailing_address_state
  	add_column :participants, :mailing_address_postcode, :string unless column_exists? :participants, :mailing_address_postcode

  	rename_column :participants, :contact_number, :primary_contact_number unless column_exists? :participants, :primary_contact_number
  	add_column :participants, :primary_contact_number_type, :integer  unless column_exists? :participants, :primary_contact_number_type # home, mobile, work
  	add_column :participants, :secondary_contact_number, :string unless column_exists? :participants, :secondary_contact_number
  	add_column :participants, :secondary_contact_number_type, :integer unless column_exists? :participants, :secondary_contact_number_type # home, mobile, work

    unless column_exists? :participants, :status
    	remove_column :participants, :active, :status
    	add_column :participants, :status, :integer # interested, recruited, included, withdrawn, excluded, completed
    end

  	add_column :participants, :screening_document_id, :integer unless column_exists? :participants, :screening_document_id

	  add_column :notes, :assign_notification_to, :integer unless column_exists? :notes, :assign_notification_to # user_id

	
    remove_column :users, :blinded if column_exists? :users, :blinded

	  add_column :studies, :study_list, :integer unless column_exists? :studies, :study_list
  end
end
