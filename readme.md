Simple maintenance mode inserted into your app.  Enable with a the MAINTENANCE env var.

# Usage in your rackup file

    require 'lib/rack/maintenance'
    use Rack::Maintenance

Or provide your own response:

    require 'lib/rack/maintenance'
    use Rack::Maintenance, [503,{'Content-Type'=>'text/html'}, File.read('public/maintenance.html')]

# Running the example

With maintenance mode off:

    $ cd example
    $ rackup config.ru
    $ curl http://localhost:9292
    If you're seeing this, maintenance mode is turned off and the app is serving pages normally

    $ MAINTENANCE=on rackup config.ru
    $ curl http://localhost:9292
    Maintenance mode on!

