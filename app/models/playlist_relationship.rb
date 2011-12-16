class PlaylistRelationship < ActiveRecord::Base
	attr_accessible :playlist_id, :playlist_track_id, :position
	
	belongs_to :playlist, :class_name => "Playlist"
	belongs_to :playlist_track, :class_name => "Track"
	 
	validates :playlist_id, :presence => true
  validates :playlist_track_id, :presence => true
end
