require 'spec_helper'

describe PagesController do
	render_views
	
	 describe "GET 'home'" do
	
		describe "when not signed in" do
		
			before(:each) do
				get :home
			end
			
			it "should be successful" do
				response.should be_success
			end
			
			it "should have the right title" do
				response.should have_selector("title",
																			:content => "Home")
			end
		end
		
		describe "when signed in" do
		
			before(:each) do
				@user = test_sign_in(Factory(:user))
			end
			
			it "should display the record index" do
				# fill this in
			end
		end
	end

  describe "GET 'contact'" do
		
    it "should be successful" do
      get 'contact'
			response.should be_success
    end
		
		it "should have the right title" do
			get 'contact'
			response.should have_selector("title", 
																		:content => "Contact")
		end
  end

  describe "GET 'about'" do
   
		it "should be successful" do
			get 'about'
			response.should be_success
    end
		
		it "should have the right title" do
			get 'about'
			response.should have_selector("title", 
																		:content => "About")
		end
  end

  describe "GET 'help'" do
		
    it "should be successful" do
     	get 'help'
			response.should be_success
    end
		
		it "should have the right title" do
			get 'help'
			response.should have_selector("title", 
																		:content => "Help")
		end
  end
end