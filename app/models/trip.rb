class Trip < ActiveRecord::Base  
  has_many :days, -> { order("position ASC") }  #lower in list means a higher position number
  
  after_create :add_first_day
  
  def add_first_day
    self.days.create
  end
end
