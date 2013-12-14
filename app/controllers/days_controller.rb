class TripsController < ApplicationController
  def create
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
  
end
