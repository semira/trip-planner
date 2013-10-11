require 'wikilocation'

class SearchController < ApplicationController
  def wikipedia_gps
    # get the params
    lat = params[:lat]
    long = params[:long]
    
    loc = WikiLocation.new
    result = loc.articles(lat, long)
    
    # call the appropriate view based on what the client requested
    respond_to do | format |
      format.json { render json: result }
    end
  end
end
