class Playlist < ActiveRecord::Base
	attr_accessible :title, :grouping, :duration, :description, :year
	
	has_many :reverse_playlist_relationships, :foreign_key => "playlist_id",
                                   :class_name => "PlaylistRelationship",
                                   :dependent => :destroy
	has_many :playlist_tracks, :through => :reverse_playlist_relationships
	
	def in_playlist?(playlist_track)
		reverse_playlist_relationships.find_by_playlist_track_id(playlist_track)
	end
	
	def add_to_playlist!(playlist_track)
		reverse_playlist_relationships.create!(:playlist_track_id => playlist_track.id)
	end
	
	def remove_from_playlist!(playlist_track)
		reverse_playlist_relationships.find_by_playlist_track_id(playlist_track).destroy
	end
end
