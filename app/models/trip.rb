class Trip < ActiveRecord::Base  
  has_many :days, -> { order("position ASC") }  #lower in list means a higher position number
  
end
