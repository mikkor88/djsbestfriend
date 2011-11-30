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

end