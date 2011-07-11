require 'spec_helper'

describe Admin::TypesController do
  describe "Type management" do
	before(:each) do
	  @type = FactoryGirl.create(:type)
	end
	it "destroys the type" do
	  delete :destroy, :type => @type
	  response.body.should include "removed"
	end
  end
end