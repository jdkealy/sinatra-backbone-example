module Medical
  class Api < Medical::Sinatra
    set :app_file,       __FILE__
    set :root,           ::File.join(::File.expand_path(::File.dirname(__FILE__)), '/')
    set :views,          ::File.join(::File.expand_path(::File.dirname(__FILE__)), '/views')
    set :public_folder,  ::File.join(::File.expand_path(::File.dirname(__FILE__)), '/public')
    set :run,            false
    set :static,         true
    set :methodoverride, true

    configure do
      require 'sinatra/reloader'
      require 'sinatra/jstpages'

      register ::Sinatra::JstPages
      register ::Sinatra::Reloader

      serve_jst '/jst.js'

      also_reload "#{::File.expand_path(::File.dirname(__FILE__))}/../lib/**/*.rb"
    end

    get '/' do
      erb :index
    end
  end
end
