class Flight < ActiveRecord::Base
  belongs_to :from_airport, class_name: "Airport"
  belongs_to :to_airport, class_name: "Airport"

  def self.get_dates
    Flight.uniq.order(start_time: :asc)
               .pluck(:start_time)
               .map{ |date| [date.strftime("%m/%d/%Y"), date.to_date] }
                             #Why do I have to do this? ^

    # TODO: figure out why this doesn't work??
    # Flight.pluck(:start_time).map(&:strftime("%d/%m/%Y"))
  end

  def self.search(params)
    date = params[:date].to_date
    day = date.beginning_of_day..date.end_of_day

    Flight.where(from_airport_id: params[:from], to_airport_id: params[:to],
                 start_time: day)
          .includes(:from_airport, :to_airport)

  end

end
