class PassengerMailer < ApplicationMailer
    default from: 'notifications@odin_flight_booker.com'

    def booking_confirmation_email
        @passenger = params[:passenger]
        mail(to: @passenger.email, subject: 'Booking Confirmation')
    end
end
