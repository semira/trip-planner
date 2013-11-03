# multiple days in a trip. each day has a city, notes, and hotel associated with it.
class Day < ActiveRecord::Base
  attr_accessor :city, :notes, :hotel
  
  belongs_to :trip
  
end
