require File.dirname(__FILE__) + '/../lib/rack/maintenance'

use Rack::Maintenance, [503, {'Content-Type'=>'text/plain'}, StringIO.new("Maintenance mode on!\n")]

app = lambda { |env| [200, {'Content-Type'=>'text/plain'}, StringIO.new("If you're seeing this, maintenance mode is turned off and the app is serving pages normally\n")] }

run app
