# == Schema Information
#
# Table name: airports
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Airport < ActiveRecord::Base
  has_many :departing_flights, class_name: "Flight",
                               foreign_key: :from_airport_id
  has_many :arriving_flights, class_name: "Flight",
                              foreign_key: :to_airport_id

end
