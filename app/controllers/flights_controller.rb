class FlightsController < ApplicationController
    def index
        @airports = Airport.pluck(:code, :id)
        @dates = Flight.get_dates

        @flights = Flight.search(params) if params[:commit]

    end
end
