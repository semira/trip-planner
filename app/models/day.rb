# multiple days in a trip. each day has a city, notes, and hotel associated with it.
class Day < ActiveRecord::Base
  
  belongs_to :trip
  acts_as_list scope: :trip
  after_create :move_to_end_of_trip
  
  def move_to_end_of_trip
    self.move_to_bottom
  end  
end
