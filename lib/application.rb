require 'sinatra/base'
require 'json'
require File.join(File.dirname(__FILE__), 'configuration.rb')

class Application < Sinatra::Base
  get '/' do
    content_type :json

    GeoIP.locate(request_ip).to_json
  end

  private
  def request_ip
    params["ip"] || request.ip
  end
end
