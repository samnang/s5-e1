lib_dir = File.expand_path('../lib', __FILE__)
$:.unshift lib_dir unless $:.include?(lib_dir)

require 'rspec'
require 'sinatra'
require 'rack/test'
require 'webmock/rspec'
require 'crack'

require 'application'
require 'location'
require 'weather'

set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

module SpecHelper
  def app
    Application
  end

  def stub_requests
    stub_request(:get, "http://geoip.prototypeapp.com/api/locate?ip=127.0.0.1").
      to_return(:body => load_fixture("location.json"), :headers => { "Content-Type" => "application/json" })

    stub_request(:get, "http://www.google.com/ig/api?weather=Phnom%20Penh,%20Cambodia").
      to_return(:body => load_fixture("weather.xml"), :headers => { "Content-Type" => "text/xml" })
  end

  def load_fixture(filename)
    File.read(File.expand_path('../fixtures/' + filename, __FILE__))
  end

  def parse_json(json)
    Crack::JSON.parse(json)
  end
end

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  conf.include SpecHelper
end
