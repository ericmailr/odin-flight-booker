class Flight < ApplicationRecord
   belongs_to :from_airport, class_name: "Airport"
   belongs_to :to_airport, class_name: "Airport"
   has_many :bookings
   has_many :passengers, through: :bookings

   def self.dates_formatted
        flights = Flight.all
        departure_dates = flights.map { |f| f.departure_time.strftime("%m/%d/%Y") }.uniq
   end

   def self.flights_from_airport(airport_id)
        return [] if airport_id.empty?
        Flight.where(from_airport_id: airport_id)
   end

   def self.flights_to_airport(airport_id)
        return [] if airport_id.empty?
        Flight.where(to_airport_id: airport_id)
   end

   def self.flights_on_date(departure_date)
        return [] if departure_date.empty? 
        formatted_date = Date.strptime(departure_date, '%m/%d/%Y')
        Flight.where(departure_time: formatted_date.beginning_of_day..formatted_date.end_of_day)
   end

   def self.search(search_params)
       flights = []
       flights << Flight.flights_from_airport(search_params[:from_airport_id])
       flights << Flight.flights_to_airport(search_params[:to_airport_id])
       flights << Flight.flights_on_date(search_params[:departure_date])

       flights.flatten.empty? ? [] : flights = flights.reject{|arr| arr.empty?}.reduce(:&)
   end

   def formatted_departure_time
        departure_time.strftime('%b %-d, %Y - %l:%M %P') 
   end
end
