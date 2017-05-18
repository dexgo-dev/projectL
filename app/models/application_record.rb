class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/

  # def self.to_csv(options = {})
  #   CSV.generate(options) do |csv|
  #     csv << column_names
  #     all.each do |record|
  #       csv << record.attributes.values_at(*column_names)
  #     end
  #   end
  # end

end
