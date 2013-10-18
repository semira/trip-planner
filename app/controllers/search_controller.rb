require 'wikilocation'
require 'result'

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
  
  # throwaway controller for the purposes of laying out the ui
  def test_search
    lat = params[:lat]
    long = params[:long]
    
    @results = []
    r = Result.new ({:title => "Jaya Sri Maha Bodhi", :shortText => "Jaya Sri Maha Bodhi (Sinhala:ජය ශ්‍රි මහා බොධිය) is a Sacred Fig tree in Anuradhapura, Sri Lanka. It is said..."}) 
    @results << r
    r = Result.new ({:title => "Jetavanaramaya", :shortText => "The Jetavanaramaya is a stupa, located in the ruins of Jetavana Monastery in the sacred world heritage city ..."}) 
    @results << r
    r = Result.new ({:title => "Abhayagiri vihāra", :shortText => "Abhayagiri Vihāra was a major monastery site of Theravada Buddhism that was situated in Anuradhapura, Sri Lanka. It is one..."})
    @results << r
    r = Result.new ({:title => "Ruwanwelisaya", :shortText => "The Ruwanwelisaya is a stupa in Sri Lanka, considered a marvel for its architectural qualities and sacred to many..."})
    @results << r
    
    respond_to do | format |
      format.json { render json: "success" }
      format.js
    end
  end
  
  
end
