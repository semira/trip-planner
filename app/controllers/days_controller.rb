class DaysController < ApplicationController
  include CurrentTrip
  before_action :set_trip, only: [:update]
  
  def create
    @day = @trip.days.build(params[:day])

    respond_to do |format|
      if @day.save
        format.json { render json: @day }
      else
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @day = @trip.days.find(params[:pk])
    @day.update_column(params[:name], params[:value]) 
    puts @day.city
    respond_to do |format|
      if @day.save       
        format.json { render json: @day.as_json }
      else
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end
  
end
