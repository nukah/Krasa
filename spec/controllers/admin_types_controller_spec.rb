require 'spec_helper'

describe Admin::TypesController do
  render_views
  
  before do
	@user = Factory.create(:user_admin)
	sign_in @user
  end
  
  describe "Type management" do
	before(:each) do
	  @type = FactoryGirl.create(:type)
	end
	it "destroys the type" do
	  delete :destroy, :id => @type.id
	  flash[:notice].should match("Successfully removed")
	  response.should redirect_to(admin_types_path)
	end
  end
  
  describe "Managing taxons in type" do
	before do
	  @type = FactoryGirl.create(:type)
	  @new_taxon = FactoryGirl.create(:taxons)
	end

	it "adds a taxon to a type" do
	  put :add, :id => @type.id, :taxon => @new_taxon
	  flash[:notice].should match("Taxon added")
	end
  end
end