class Trip < ActiveRecord::Base  
  has_many :days, -> { order("position ASC") }  #lower in list means a higher position number
  
  after_create :move_to_end_of_trip
  
  def move_to_end_of_trip
    self.move_to_bottom
  end
end
