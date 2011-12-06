class CreateOwnershipRelationships < ActiveRecord::Migration
  def change
    create_table :ownership_relationships do |t|
      t.integer :owner_id
      t.integer :owned_record_id

      t.timestamps
    end
		
		add_index :ownership_relationships, :owner_id
		add_index :ownership_relationships, :owned_record_id
  end
end
