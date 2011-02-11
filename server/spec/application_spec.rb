require 'spec_helper'

describe Application do
  
  context "GET /" do
    before do
      stub_requests
    end

    it "should reponse sucess" do
      get "/"

      last_response.should be_ok
    end

    it "should reponse sucess when passing ip param" do
      get "/", :ip => "127.0.0.1"

      last_response.should be_ok
    end

    it "should reponse location & weather of request ip" do
      get "/"

      response = parse_json(last_response.body)
      response['location']["gmt_offset"].should == "7"
      response["location"]["country"].should == "Cambodia"

      response["weather"]["temp_c"].should == "24"
      response["weather"]["temp_f"].should == "75"
      response["weather"]["condition"].should == "Haze"
    end
  end
end
