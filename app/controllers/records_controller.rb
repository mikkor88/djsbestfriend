class RecordsController < ApplicationController
  def new
		@record = Record.new
		@title = "Records"
  end

	def show
		@record = Record.find(params[:id])
		@title = @record.artist + " - " + @record.title
	end
end
