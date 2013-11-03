class Trip < ActiveRecord::Base
  attr_accessor :tripname, :startdate
  
  has_many :days
end
