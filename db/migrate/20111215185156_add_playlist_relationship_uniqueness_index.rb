class AddPlaylistRelationshipUniquenessIndex < ActiveRecord::Migration
  def change
		add_index :playlist_relationships, :playlist_id
		add_index :playlist_relationships, :playlist_track_id
		add_index :playlist_relationships, [:playlist_id, :playlist_track_id], 
																			 :name => "pls_relationships_index_on_pls_id_and_pls_track_id", 
																			 :unique => true
  end
end
