class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.build
    params[:num_passengers].to_i.times{ @booking.passengers.build }
    @booking.passengers.build if params[:num_passengers].blank?
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.flight_id = booking_params[:flight_id]
    if @booking.save!
      PassengerMailer.confirmation_email(@booking).deliver_now
      redirect_to @booking
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
    @passengers = @booking.passengers
  end

  def booking_params
    params.require(:booking).permit(:flight_id,
                                    passengers_attributes: [:name, :email] )
  end
end
