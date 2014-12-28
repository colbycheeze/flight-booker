#Delete all data here, so we don't have to do db:reset first.
Flight.delete_all
Airport.delete_all

airports = Airport.create!([{ code: 'SFO'},
                            { code: 'NYC'},
                            { code: 'LAX'},
                            { code: 'DAL'}])



n = DateTime.now
date_range = ((n + 2.days)..(n + 30.days)).to_a
duration_range = (3.hours..8.hours).to_a
airports.each do |airport|
    begin
        another_airport = airports.sample
    end until another_airport != airport
    5.times do
        Flight.create!(start_time: date_range.sample,
                       duration: duration_range.sample.to_i,
                       from_airport: airport,
                       to_airport: another_airport)
    end
end


