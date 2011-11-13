require 'spec_helper'

describe RecordsController do
	render_views

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
		
		it "should have the right title" do
				get :new
				response.should have_selector("title", :content => "Records")
		end
  end

	describe "GET 'show'" do
  
    before(:each) do
	  @record = Factory(:record)
		end
	
		it "should be successful" do
			get :show, :id => @record
			response.should be_success
		end
	
		it "should find the right record" do
			get :show, :id => @record
			assigns(:record).should == @record
		end
    
		it "should have the right window title" do
      get :show, :id => @record
      response.should have_selector("title", :content => @record.artist + " - " + @record.title)
    end

    it "should include the record's title" do
      get :show, :id => @record
      response.should have_selector("h1", :content => @record.title)
    end
	end
end
