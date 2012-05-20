require 'rubygems'
require "bundler/setup"
require 'mongo'
require 'net/http'
require 'yajl'
require 'oauth'
require 'sinatra/base'
require 'mongoid'

module Medical
  class Sinatra < ::Sinatra::Base
    set :static,         true
    set :methodoverride, true

    configure do
      require 'sinatra/reloader'
      register ::Sinatra::Reloader
      #also_reload "#{::File.expand_path(::File.dirname(__FILE__))}/**/*.rb"
    end

    helpers do
      #def json(callback, hash = {})
      #  cache_control :private, :must_revalidate, :max_age => 0
      #  if callback
      #    content_type 'text/javascript'
      #    "#{callback}(#{Yajl::Encoder.encode(hash)});"
      #  else
      #    content_type 'application/json'
      #    Yajl::Encoder.encode(hash)
      #  end
      #end
    end
  end
end


tmp_environment = :development
ENV['ENVIRONMENT'] = ENV['ENVIRONMENT'] || ENV['RACK_ENV']
if ENV['ENVIRONMENT']
  tmp_environment = ENV['ENVIRONMENT'].to_sym
end

# just in case - none is the simplest rack env - translate to production
if tmp_environment == :none
  tmp_environment = :production
end

if tmp_environment == :production
  tmp_db_name = "medical"
elsif tmp_environment == :test
  tmp_db_name = "medical_test"
elsif tmp_environment == :staging
  tmp_db_name = "medical_staging"
else
  tmp_db_name = "medical_dev"
end

#::Qu.backend.max_retries = 0
#::Qu.configure do |c|
#  c.connection = Mongo::Connection.new('localhost', 27017).db(tmp_db_name + "_qu")
#  c.logger = Logger.new(STDOUT)
#  #c.logger.level = Logger::DEBUG  # in case we need to see what is going on there
#  c.logger.level = Logger::INFO
#end

#CORRELATE_ENV = tmp_environment
#CORRELATE_DB_NAME = tmp_db_name
#
#mongoid_conn = Mongo::Connection.new 'localhost', 27017, :pool_size => 10
#Mongoid.configure do |c|
#  c.max_retries_on_connection_failure = 0
#  c.identity_map_enabled = false
#  begin
#    db_name = tmp_db_name
#    c.master = mongoid_conn.db(db_name)
#  rescue Exception=>err
#    abort "An error occurred while creating the mongoid connection pool: #{err}"
#  end
#end
#
## load all models
#Dir.glob(File.expand_path(File.dirname(__FILE__)) + '/models/*.rb') {|file| require file}
#Dir.glob(File.expand_path(File.dirname(__FILE__)) + '/helpers/*.rb') {|file| require file}
