class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end 
  
  def new
  end
  
  def update
    respond_to do |format| 
      #if @line_item.save
        format.json 
      #end
    end
  end
  
end
