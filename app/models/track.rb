class Track < ActiveRecord::Base
	attr_accessible :title, :artist, :genre, :year, :track_number, :bpm, :duration
	belongs_to :record
	
	default_scope :order => 'tracks.track_number'

	validates :record_id, :presence => true
end