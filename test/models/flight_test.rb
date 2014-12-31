# == Schema Information
#
# Table name: flights
#
#  id              :integer          not null, primary key
#  start_time      :datetime
#  duration        :integer
#  from_airport_id :integer
#  to_airport_id   :integer
#  created_at      :datetime
#  updated_at      :datetime
#

require 'test_helper'

class FlightTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
