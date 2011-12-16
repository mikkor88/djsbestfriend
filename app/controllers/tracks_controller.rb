class TracksController < ApplicationController
	 def create
		@record = Record.find(params[:id]) # this should be the record to which the track is added.
    @track  = @record.tracks.build(params[:track])
    if @track.save
      flash[:success] = "Track(s) created!"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

	def update
		@track = Track.find(params[:id])
		# when the user deletes the track from all playlists it has previously belonged to
		if params[:track].nil? && !@track.playlists.nil?
			@playlists = Playlist.find(@track.playlist_ids)
			for playlist in @playlists
				@track.remove_from_playlist!(playlist)
			end
			
		# when the track hasn't belonged to any playlists and the user doesn't select anything but still clicks Update
		elsif params[:track].nil?
		
		# do nothing.
	
		else
		@playlists = Playlist.find(params[:track][:playlist_ids])
			for playlist in @playlists
					if @track.playlists.include?(playlist)
						# do nothing because track is already in this playlist.
					else
						@track.add_to_playlist!(playlist)
					end
			end
			for playlist in @track.playlists
				if @playlists.include?(playlist)
					#do nothing because track is already in playlist.
				else
					@track.remove_from_playlist!(playlist)
				end
			end
		end
		redirect_to :back
	end
end