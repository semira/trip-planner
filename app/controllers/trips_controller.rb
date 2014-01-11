class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end 
  
  def create
    @trip=Trip.create(params[:trip])
    redirect_to trip_path @trip
  end
  
  def show
    @trip = Trip.find(params[:id])
    session[:trip_id] = @trip.id
  end
  
  def update
    @trip = Trip.find(params[:id])
    respond_to do |format| 
      if @trip.update_attribute(params[:name], params[:value])
        @fieldname = params[:name]
        format.json { render json: @trip.as_json }
      else
        format.json { render head :no_content} #TO DO - do something real here
      end
    end
  end
  
  private
  
end
