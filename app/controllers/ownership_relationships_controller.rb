class OwnershipRelationshipsController < ApplicationController
  before_filter :authenticate

  def create
    @record = Record.find(params[:ownership_relationship][:owned_record_id])
    current_user.own!(@record)
		redirect_to @record
  end

  def destroy
    @record = OwnershipRelationship.find(params[:id]).owned_record
    current_user.stop_owning!(@record)
    redirect_to @record
	end
end