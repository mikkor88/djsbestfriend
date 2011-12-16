class Track < ActiveRecord::Base
	attr_accessible :title, :artist, :genre, :year, :track_number, :bpm, :duration, :playlist_ids
	belongs_to :record
	
	has_many :playlist_relationships, :foreign_key => "playlist_track_id",
													 :dependent => :destroy
	has_many :playlists, :through => :playlist_relationships
	
	default_scope :order => 'tracks.track_number'

	validates :record_id, :presence => true
	
	def in_playlist?(playlist)
		playlist_relationships.find_by_playlist_id(playlist)
	end
	
	def add_to_playlist!(playlist)
		playlist_relationships.create!(:playlist_id => playlist.id)
	end
	
	def remove_from_playlist!(playlist)
		playlist_relationships.find_by_playlist_id(playlist).destroy
	end
end