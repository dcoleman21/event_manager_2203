# ./lib/event_manager.rb
require "csv"
# puts "EventManager initialized."

# contents = File.read "data/event_attendees.csv" #make sure to add data before event_attendees.csv for the file path
# puts contents

def format_zipcode(zipcode)
  # if !zipcode 
  # "00000"
  # elsif zipcode.length == 5
  #   zipcode
  # elsif zipcode.length > 5
  #   zipcode[0..4]
  # elsif zipcode.length < 5
  #   zipcode.rjust(5, "0")
  # end
  zipcode.to_s.rjust(5,"0")[0..4] 
  #this take all of the above cases. 
  #By calling .to_s first, we account for nil by turing it into an empty string
end

contents = CSV.open('data/event_attendees.csv', headers: true, header_converters: :symbol)
contents.each do |row|
  name = row[:first_name]
  zipcode = row[:zipcode]

  formatted_zipcode = format_zipcode(zipcode)

  puts "#{name} #{formatted_zipcode}"
end
