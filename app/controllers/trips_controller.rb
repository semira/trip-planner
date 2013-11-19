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
    @trip = Trip.find(params[:id])
    puts "stuff: " + params[:name] + ", " + params[:value]
    respond_to do |format| 
      #if @trip.update_attribute(params[:name], params[:value])
      if @trip.update_attribute(trip_params)
        format.json { render json: @trip.as_json }
      else
        format.json { render head :no_content}
      end
    end
  end
  
  def trip_params
    #params.permit(:name, :value)
    params.require(:trip).permit(:tripname)
  end
  
end
