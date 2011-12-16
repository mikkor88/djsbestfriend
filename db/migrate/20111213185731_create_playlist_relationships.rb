class CreatePlaylistRelationships < ActiveRecord::Migration
  def change
    create_table :playlist_relationships do |t|
      t.integer :playlist_id
      t.integer :playlist_track_id
      t.integer :position

      t.timestamps
    end
  end
end
