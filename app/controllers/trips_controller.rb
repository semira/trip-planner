class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :update, :destroy]
  
  def index
    @trips = Trip.all
  end 
  
  def create
    @trip=Trip.create(params[:trip])
    redirect_to trip_path @trip
  end
  
  def show
    session[:trip_id] = @trip.id
  end
  
  def update
    respond_to do |format| 
      if @trip.update_attribute(params[:name], params[:value])
        @fieldname = params[:name]
        format.json { render json: @trip.as_json }
      else
        format.json { render head :no_content} #TO DO - do something real here
      end
    end
  end
  
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def set_trip
    @trip = Trip.find(params[:id])
  end
end
