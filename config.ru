require "#{::File.expand_path(::File.dirname(__FILE__))}/lib/config.rb"
require "#{::File.expand_path(::File.dirname(__FILE__))}/app.rb"

routes = {}
routes['/'] =  Medical::Api

run Rack::URLMap.new routes
