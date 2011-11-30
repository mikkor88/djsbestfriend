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
	
	describe "PUT 'update'" do

    before(:each) do
      @record = Factory(:record)
    end

    describe "failure" do

      before(:each) do
        @attr = { :title => "", :artist => "", :genre => "",
                  :type => "" }
      end

      it "should render the 'edit' page" do
        put :update, :id => @record, :record => @attr
        response.should render_template('edit')
      end

      it "should have the right title" do
        put :update, :id => @record, :record => @attr
        response.should have_selector("title", :content => "Edit record")
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :title => "New Record", :artist => "Awesome Band",
                  :genre => "Funk", :type => "7\"" }
      end

      it "should change the record's attributes" do
        put :update, :id => @record, :record => @attr
        @record.reload
        @record.title.should  == @attr[:title]
        @record.artist.should == @attr[:artist]
      end

      it "should redirect to the record show page" do
        put :update, :id => @record, :record => @attr
        response.should redirect_to(record_path(@record))
      end

      it "should have a flash message" do
        put :update, :id => @record, :record => @attr
        flash[:success].should =~ /Record updated./
      end
    end
  end
	
	describe "DELETE 'destroy'" do

    before(:each) do
      @record = Factory(:record)
			@user = Factory(:user)
    end

		describe "as a non-signed-in user" do
      it "should deny access" do
        delete :destroy, :id => @record
        response.should redirect_to(signin_path)
      end
    end

    describe "as an admin user" do

      before(:each) do
        @admin = Factory(:user, :email => "admin@example.com", :admin => true)
        test_sign_in(@admin)
      end

      it "should destroy the record" do
        lambda do
          delete :destroy, :id => @record
        end.should change(Record, :count).by(-1)
      end

      it "should redirect to the records page" do
        delete :destroy, :id => @record
        response.should redirect_to(records_path)
      end
    end
  end
end
