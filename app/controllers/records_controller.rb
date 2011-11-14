class RecordsController < ApplicationController
  def new
		@record = Record.new
		@title = "Add a new record"
  end

	def show
		@record = Record.find(params[:id])
		@title = @record.artist + " - " + @record.title
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
end
