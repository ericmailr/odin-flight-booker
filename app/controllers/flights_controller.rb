class FlightsController < ApplicationController

    def index
        @airport_options = Airport.all.map{ |a| [ a.code, a.id ] }
        @date_options = Flight.dates_formatted
        @flights = params[:search] ? Flight.search(search_params) : []
        @number_of_passengers = params[:search] ? search_params[:number_of_passengers] : nil
    end

    
    private
        
        def search_params
            params.require(:search).permit(:from_airport_id, :to_airport_id, :number_of_passengers, :departure_date)
        end
end
