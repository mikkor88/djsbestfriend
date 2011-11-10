require 'spec_helper'

describe Release do

  before(:each) do
   @attr = { 
		:title => "Top Seller", 
		:artist => "A Great Performer",
		:genre => "Blues",
		:type => "LP",
		:catalog_number => "AD315L"
	 }
  end
  
  it "should create a new instance given valid attributes" do
    Release.create!(@attr)
  end
  
  it "should require a title" do
    no_title_release = Release.new(@attr.merge(:title => ""))
		no_title_release.should_not be_valid
  end
  
  it "should require an artist" do
    no_artist_release = Release.new(@attr.merge(:artist => ""))
		no_artist_release.should_not be_valid
  end
  
  it "should require a genre" do
    no_genre_release = Release.new(@attr.merge(:genre => ""))
		no_genre_release.should_not be_valid
  end
	
	it "should require a type" do
    no_type_release = Release.new(@attr.merge(:type => ""))
		no_type_release.should_not be_valid
  end
  
  it "should reject unknown types" do
		unknown_type_release = Release.new(@attr.merge(:type => "15xLP"))
		unknown_type_release.should_not be_valid
	end
	
	it "should accept default types" do
		default_type_release = Release.new(@attr.merge(:type => "2xLP"))
		default_type_release.should be_valid
	end
  
	it "should reject duplicate releases due to same title and catalog number combo" do
		# Put a release with given attributes
		Release.create!(@attr)
		release_with_same_data = Release.new(@attr)
		release_with_same_data.should_not be_valid
  end
end

