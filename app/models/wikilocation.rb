require 'faraday'

class WikiLocation
  def initialize
    @conn = Faraday.new(:url => 'http://api.wikilocation.org')
  end

  # gets articles around the location specified with lat, long
  # Params:
  # +lat+:: the latitude to use from -90 to 90
  # +long+:: the longitude to use from -90 to 90
  def articles(lat, long)
    # create a request for articles
#    @conn.uri = "/articles"
    @conn.params['lat'] = lat
    @conn.params['lng'] = long
    @conn.params['limit'] = '1'
    @conn.response :logger
    response = @conn.get "/articles" #get a location from wikilocation
    return response.body
  end
end
