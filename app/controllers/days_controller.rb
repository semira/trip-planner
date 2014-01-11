class DaysController < ApplicationController
  include CurrentTrip
  before_action :set_trip, only: [:create, :update, :update_position]
  
  def create
    @day = @trip.days.create()

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
    respond_to do |format|
      if @day.save       
        format.json { render json: @day.as_json }
      else
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update_position
    @day = @trip.days.find(params[:pk])
    respond_to do |format|
      if @day.insert_at(params[:newPos].to_i)    
        format.json { render json: @day.as_json }
      else
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end
  
end
