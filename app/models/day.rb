# multiple days in a trip. each day has a city, notes, and hotel associated with it.
class Day < ActiveRecord::Base
  
  belongs_to :trip
  acts_as_list scope: :trip  
end
