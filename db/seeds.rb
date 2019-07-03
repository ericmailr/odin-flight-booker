# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Airport.delete_all
Flight.delete_all

Airport.create!(code: "SFO")
Airport.create(code: "NYC")
Airport.create(code: "LAX")
Airport.create(code: "PDX")
Airport.create(code: "DAL")

Flight.create!(from_airport_id: Airport.find_by(code: "SFO").id, to_airport_id: Airport.find_by(code: "NYC").id, departure_time: DateTime.new(2019,5,3,4,20,0)) 

Flight.create!(from_airport_id: Airport.find_by(code: "DAL").id, to_airport_id: Airport.find_by(code: "NYC").id, departure_time: DateTime.new(2019,3,4,13,3,0))

Flight.create!(from_airport_id: Airport.find_by(code: "NYC").id, to_airport_id: Airport.find_by(code: "LAX").id, departure_time: DateTime.new(2019,1,5,15,30,0))

Flight.create!(from_airport_id: Airport.find_by(code: "DAL").id, to_airport_id: Airport.find_by(code: "PDX").id, departure_time: DateTime.new(2019,5,1,18,20,0))

Flight.create!(from_airport_id: Airport.find_by(code: "SFO").id, to_airport_id: Airport.find_by(code: "NYC").id, departure_time: DateTime.new(2019,4,24,12,13,0))

Flight.create!(from_airport_id: Airport.find_by(code: "DAL").id, to_airport_id: Airport.find_by(code: "NYC").id, departure_time: DateTime.new(2019,3,4,16,3,0))


#new flights

Flight.create!(from_airport_id: Airport.find_by(code: "SFO").id, to_airport_id: Airport.find_by(code: "DAL").id, departure_time: DateTime.new(2019,5,3,4,20,0)) 

Flight.create!(from_airport_id: Airport.find_by(code: "PDX").id, to_airport_id: Airport.find_by(code: "SFO").id, departure_time: DateTime.new(2019,3,4,13,3,0))

Flight.create!(from_airport_id: Airport.find_by(code: "NYC").id, to_airport_id: Airport.find_by(code: "DAL").id, departure_time: DateTime.new(2019,1,5,15,30,0))

Flight.create!(from_airport_id: Airport.find_by(code: "DAL").id, to_airport_id: Airport.find_by(code: "NYC").id, departure_time: DateTime.new(2019,1,5,15,30,0))

Flight.create!(from_airport_id: Airport.find_by(code: "SFO").id, to_airport_id: Airport.find_by(code: "NYC").id, departure_time: DateTime.new(2019,4,21,12,13,0))

Flight.create!(from_airport_id: Airport.find_by(code: "LAX").id, to_airport_id: Airport.find_by(code: "NYC").id, departure_time: DateTime.new(2019,4,4,16,3,0))

