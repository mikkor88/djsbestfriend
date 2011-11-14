require 'spec_helper'

describe RecordsController do
	render_views

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
		
		it "should have the right window title" do
			get :new
			response.should have_selector("title", :content => "Add a new record")
		end
		
		it "should have a title field" do
			get :new
			response.should have_selector("input[name='record[title]'][type='text']")
		end
	
		it "should have an artist field" do
			get :new
			response.should have_selector("input[name='record[artist]'][type='text']")
		end
	
		it "should have a genre field" do
			get :new
			response.should have_selector("input[name='record[genre]'][type='text']")
		end
		
		it "should have a type field" do
			get :new
			response.should have_selector("input[name='record[record_type]'][type='text']")
		end
		
		it "should have a year field" do
			get :new
			response.should have_selector("input[name='record[year]'][type='text']")
		end
		
		it "should have a catalog number field" do
			get :new
			response.should have_selector("input[name='record[catalog_number]'][type='text']")
		end
		
		it "should have a comment field" do
			get :new
			response.should have_selector("input[name='record[comment]'][type='text']")
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
	
	 describe "GET 'edit'" do

    before(:each) do
      @record = Factory(:record)
    end

    it "should be successful" do
      get :edit, :id => @record
      response.should be_success
    end

    it "should have the right title" do
      get :edit, :id => @record
      response.should have_selector("title", :content => "Edit record")
    end
  end
end
