# == Schema Information
#
# Table name: passengers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_passengers_on_email  (email) UNIQUE
#

class Passenger < ActiveRecord::Base

  has_many :tickets
  has_many :bookings, through: :tickets
  has_many :flights, through: :bookings

  before_save { email.downcase! }

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }


end
