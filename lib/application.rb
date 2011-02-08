require 'sinatra/base'
require 'json'
require File.join(File.dirname(__FILE__), 'configuration.rb')

class Application < Sinatra::Base
  get '/?' do
    content_type :json

    {:status => "Hello"}.to_json
  end
end
