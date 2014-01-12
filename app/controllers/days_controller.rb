class DaysController < ApplicationController
  include CurrentTrip
  before_action :set_trip
  before_action :set_day, only: [:update, :update_position, :destroy]
  
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
    respond_to do |format|
      if @day.insert_at(params[:newPos].to_i)    
        format.json { render json: @day.as_json }
      else
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @day.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end
  
  private

     def set_day
       @day = @trip.days.find(params[:pk])
     end
end
