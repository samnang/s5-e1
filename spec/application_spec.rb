require 'spec_helper'

describe Application do
  
  context "GET /" do
    it "should not 404" do
      get "/"
      last_response.ok?.should == true
    end
  end
end
