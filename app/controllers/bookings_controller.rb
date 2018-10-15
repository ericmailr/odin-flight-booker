class BookingsController < ApplicationController

    def new
        @booking = Booking.new
        @number_of_passengers = params[:number_of_passengers]
        @flight = Flight.find(params[:flight_id])
        @number_of_passengers.to_i.times do 
            @booking.passengers.build
        end
    end

    def create
        @booking = Booking.new(flight_id: booking_params[:flight_id])
        booking_params[:passengers_attributes].each do |id, hash|
            @booking.passengers.build(name: hash[:name], email: hash[:email])
        end
        if @booking.save
            @booking.passengers.each do |passenger|
                PassengerMailer.with(passenger: passenger).booking_confirmation_email.deliver_later
            end
            redirect_to @booking
        else
            redirect_to flights_path
        end
    end

    def show
       @booking = Booking.find(params[:id]) 
       @flight = Flight.find(@booking.flight_id)
    end

    private
        
        def booking_params
            params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email]) 
        end

end
