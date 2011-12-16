class Record < ActiveRecord::Base
	attr_accessible :title, :artist, :genre, :record_type, :year, :comment, :catalog_number, :tracks_attributes
	has_many :tracks, :dependent => :destroy
	accepts_nested_attributes_for :tracks
	
	has_many :ownership_relationships, :foreign_key => "owned_record_id",
													 :dependent => :destroy
	
	has_many :owners, :through => :ownership_relationships
		
	validates :title, :presence => true, :uniqueness => { :scope => :catalog_number }
	validates :artist, :presence => true
	validates :genre, :presence => true
	validates :record_type, :presence => true, :inclusion => { 
																			:in => ["12\"", "7\"", "10\"", "LP", "2xLP", "3xLP", "4xLP",
																							"Box"],
																			:message => "Select a valid type for your record." }
end