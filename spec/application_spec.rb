require 'spec_helper'

describe Application do
  
  context "GET /" do
    it "should reponse sucess" do
      get "/"

      last_response.ok?.should == true
    end

    it "should reponse location & weather of request ip" do
      get "/"

      last_response.body.should_not be_empty
    end
  end
end
