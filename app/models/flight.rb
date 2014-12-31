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

class Flight < ActiveRecord::Base
  belongs_to :from_airport, class_name: "Airport"
  belongs_to :to_airport, class_name: "Airport"
  has_many :bookings, dependent: :destroy
  has_many :passengers, through: :bookings


  def self.get_dates
    Flight.uniq.order(start_time: :asc)
               .pluck(:start_time)
               .map{ |date| [date.strftime("%m/%d/%Y"), date.to_date] }
                             #Why do I have to do this? ^

    # TODO: figure out why this doesn't work??
    # Flight.pluck(:start_time).map(&:strftime("%d/%m/%Y"))
  end

  def self.format_date(date)
    date.strftime("%B %e, %Y")
  end

  def self.format_time(date)
    date.strftime("%l:%M %p")
  end

  def self.search(params)
    #avoid returning nil when there is no search
    return [] unless params[:commit]

    date = params[:date].to_date
    day = date.beginning_of_day..date.end_of_day

    Flight.where(from_airport_id: params[:from], to_airport_id: params[:to],
                 start_time: day)
          .includes(:from_airport, :to_airport)
#avoid n+1 query ^

  end

end
