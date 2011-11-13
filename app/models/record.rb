class Record < ActiveRecord::Base
	attr_accessible :title, :artist, :genre, :record_type, :year, :comment, :catalog_number
	
	validates :title, :presence => true, :uniqueness => { :scope => :catalog_number }
	validates :artist, :presence => true
	validates :genre, :presence => true
	validates :record_type, :presence => true, :inclusion => { 
																			:in => ["12\"", "7\"", "10\"", "LP", "2xLP", "3xLP", "4xLP",
																							"Box"],
																			:message => "Select a valid type for your record." }

end
