class PlaylistsController < ApplicationController
	
	def new
		@playlist = Playlist.new
	end

	def show
		@playlist = Playlist.find(params[:id])
		@title = @playlist.title
	end
	
	def edit
		@playlist = Playlist.find(params[:id])
		@title = "Edit playlist"
	end
	
	def index
		@playlists = Playlist.paginate(:page => params[:page])
	end
	
	def create
    @playlist = Playlist.new(params[:playlist])
    if @playlist.save
			flash[:success] = "New playlist created!"
      redirect_to root_path
    else
      @title = "Add a new playlist"
      render 'new'
    end
  end
	
	def update
		@playlist = Playlist.find(params[:id])
		if @playlist.update_attributes(params[:playlist])
			flash[:success] = "playlist updated."
			redirect_to @playlist
		else
			@title = "Edit playlist"
			render 'edit'
		end
	end
	
	def destroy
		if signed_in?
			@playlist = Playlist.find(params[:id])
			@playlist.destroy
			flash[:success] = "playlist destroyed."
			redirect_to playlists_path
		else
			flash[:error] = "Please sign in to destroy a playlist."
			redirect_to signin_path
		end
	end
end