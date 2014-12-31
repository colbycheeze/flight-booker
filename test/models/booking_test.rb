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

require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
