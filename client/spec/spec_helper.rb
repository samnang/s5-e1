require 'rspec'
require 'webmock/rspec'
require_relative '../lib/geo_weather_client'

module SpecHelper
  def stub_requests
    stub_request(:get, "http://localhost:9292").
      to_return(:body => load_fixture("geo_weather.json"), :headers => { "Content-Type" => "application/json" })

    stub_request(:get, "http://localhost:9292/?ip=123.108.254.143").
      to_return(:body => load_fixture("geo_weather.json"), :headers => { "Content-Type" => "application/json" })
  end

  def load_fixture(filename)
    File.read(File.expand_path('../fixtures/' + filename, __FILE__))
  end
end

RSpec.configure do |conf|
  conf.include SpecHelper
end
