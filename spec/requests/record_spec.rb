require 'spec_helper'

describe "Records" do
  
  describe "creation" do
  
    describe "failure" do
	
	  it "should not make a new record" do
	    lambda do
			visit new_record_path
		  fill_in "Title",			:with => ""
		  fill_in "Artist",		:with => ""
		  fill_in "Genre",		:with => ""
		  fill_in "Type",	:with => ""
		  click_button
		  response.should render_template('records/new')
		  response.should have_selector("div#error_explanation")
	    end.should_not change(Record, :count)
	  end
	end
	
	describe "success" do

      it "should make a new record" do
        lambda do
          visit new_record_path
          fill_in "Title",         :with => "Jazzy Jazz"
          fill_in "Artist",        :with => "Frankie Boy"
          fill_in "Genre",				 :with => "Jazz"
          fill_in "Type",					 :with => "LP"
          click_button
          response.should have_selector("div.flash.success",
                                        :content => "New record created!")
          response.should render_template('pages/home')
        end.should change(Record, :count).by(1)
      end
    end
  end
end
