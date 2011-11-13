require 'spec_helper'

describe Record do

  before(:each) do
   @attr = { 
		:title => "Top Seller", 
		:artist => "A Great Performer",
		:genre => "Blues",
		:record_type => "LP",
		:catalog_number => "AD315L"
	 }
  end
  
  it "should create a new instance given valid attributes" do
    Record.create!(@attr)
  end
  
  it "should require a title" do
    no_title_record = Record.new(@attr.merge(:title => ""))
		no_title_record.should_not be_valid
  end
  
  it "should require an artist" do
    no_artist_record = Record.new(@attr.merge(:artist => ""))
		no_artist_record.should_not be_valid
  end
  
  it "should require a genre" do
    no_genre_record = Record.new(@attr.merge(:genre => ""))
		no_genre_record.should_not be_valid
  end
	
	it "should require a type" do
    no_type_record = Record.new(@attr.merge(:record_type => ""))
		no_type_record.should_not be_valid
  end
  
  it "should reject unknown types" do
		unknown_type_record = Record.new(@attr.merge(:record_type => "15xLP"))
		unknown_type_record.should_not be_valid
	end
	
	it "should accept default types" do
		default_type_record = Record.new(@attr.merge(:record_type => "2xLP"))
		default_type_record.should be_valid
	end
  
	it "should reject duplicate records due to same title and catalog number combo" do
		# Put a release with given attributes
		Record.create!(@attr)
		record_with_same_data = Record.new(@attr)
		record_with_same_data.should_not be_valid
  end
end