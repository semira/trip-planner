module CurrentTrip
  extend ActiveSupport::Concern
  
  private
  
  def set_trip
    @trip = Trip.find(session[:trip_id])
  rescue ActiveRecord::RecordNotFound
    @trip = Trip.create
    session[:trip_id] = @trip.id
  end
  
end