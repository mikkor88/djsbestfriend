class RecordsController < ApplicationController
	
	def new
		@record = Record.new
	end

	def show
		@record = Record.find(params[:id])
		@title = @record.artist + " - " + @record.title
		@tracks = @record.tracks
	end
	
	def edit
		@record = Record.find(params[:id])
		@title = "Edit record"
	end
	
	def index
		@records = Record.paginate(:page => params[:page])
	end
	
	def create
    @record = Record.new(params[:record])
    if @record.save
			flash[:success] = "New record created!"
      redirect_to root_path
    else
      @title = "Add a new record"
      render 'new'
    end
  end
	
	def update
		@record = Record.find(params[:id])
		if @record.update_attributes(params[:record])
			flash[:success] = "Record updated."
			redirect_to @record
		else
			@title = "Edit record"
			render 'edit'
		end
	end
	
	def destroy
		if signed_in?
			@record = Record.find(params[:id])
			@record.destroy
			flash[:success] = "Record destroyed."
			redirect_to records_path
		else
			flash[:error] = "Please sign in to destroy a record."
			redirect_to signin_path
		end
	end
end
