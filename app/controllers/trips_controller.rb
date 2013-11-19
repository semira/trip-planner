class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end 
  
  def new
  end
  
  def show
    @trip = Trip.find(params[:id])
  end
  
  def update
    respond_to do |format| 
      @trip = Trip.find(params[:id])
      if @trip.update_attribute(params[:name], params[:value])
        format.json { render json: @trip}
        return
      else
        format.json { render head :no_content}
      end
    end
  end
  
end
