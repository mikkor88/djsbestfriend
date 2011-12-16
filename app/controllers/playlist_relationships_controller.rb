class PlaylistRelationshipsController < ApplicationController
  before_filter :authenticate

  def create
    @track = Track.find(params[:playlist_relationship][:playlist_track_id])
    @playlist = Playlist.find(params[:playlist_relationship][:playlist_id])
		@track.add_to_playlist!(@playlist)
		redirect_to :back
  end

  def destroy
    @track = PlaylistRelationship.find(params[:id]).playlist_track
		@playlist = Playlist.find(params[:playlist_relationship][:playlist_id])
    @track.remove_from_playlist!(@playlist)
    redirect_to :back
	end
end