class OwnershipRelationship < ActiveRecord::Base
	attr_accessible :owned_record_id
	
	belongs_to :owner, :class_name => "User"
	belongs_to :owned_record, :class_name => "Record"
	 
	validates :owner_id, :presence => true
  validates :owned_record_id, :presence => true
end
