# == Schema Information
#
# Table name: tickets
#
#  id           :integer          not null, primary key
#  passenger_id :integer
#  booking_id   :integer
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_tickets_on_booking_id    (booking_id)
#  index_tickets_on_passenger_id  (passenger_id)
#

class Ticket < ActiveRecord::Base
  belongs_to :passenger
  belongs_to :booking

  validates :passenger_id, presence: true
  validates :booking_id, presence: true
end
