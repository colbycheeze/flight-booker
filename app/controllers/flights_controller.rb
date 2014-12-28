class FlightsController < ApplicationController
    def index
        @flight = Flight.first
    end
end
