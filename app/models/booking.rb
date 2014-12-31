# == Schema Information
#
# Table name: bookings
#
#  id         :integer          not null, primary key
#  flight_id  :integer
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_bookings_on_flight_id  (flight_id)
#

class Booking < ActiveRecord::Base
  belongs_to :flight
  has_many :tickets
  has_many :passengers, through: :tickets
  accepts_nested_attributes_for :passengers

  validates :flight_id, presence: true

end
