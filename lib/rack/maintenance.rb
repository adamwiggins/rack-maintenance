module Rack
  class Maintenance
    DEFAULT_RESPONSE = [
      422,
      { "Content-Type" => "text/html" },
      "<body><h2>We are undergoing maintenance right now, please try again later.</h2></body></html>"
    ]

    def initialize(app, maintenance_response=DEFAULT_RESPONSE)
      @app = app
      @maintenance_response = maintenance_response
    end

    def call(env)
      if ENV['MAINTENANCE'] == 'on'
        @maintenance_response
      else
        @app.call(env)
      end
    end
  end
end
