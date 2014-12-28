#Delete all data here, so we don't have to do db:reset first.
Flight.delete_all
Airport.delete_all

airports = Airport.create!([{ code: 'SFO'},
                            { code: 'NYC'},
                            { code: 'LAX'},
                            { code: 'DAL'}])


duration_range = (3.hours..8.hours).to_a
airports.each do |airport|
  Flight.create!(start_time: DateTime.now + duration_range.sample.seconds,
                 duration: = duration_range.sample.to_i,
                 from_airport: airports.sample,
                 to_airport: airports.sample)


