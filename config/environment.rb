# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Wikigps::Application.initialize!

# date format
Time::DATE_FORMATS[:day_then_date] = lambda { |time| time.strftime("%a, %-d %b %Y") }
