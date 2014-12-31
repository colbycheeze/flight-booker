class PassengerMailer < ActionMailer::Base
  default from: "colby@colbycheeze.com"

  def confirmation_email(booking)
    @booking = booking
    @flight = @booking.flight
    @passengers = @booking.passengers
    mail(to: @passengers.first.email, subject: "Flight Confirmation for Flight #{@flight.id}")
  end
end
