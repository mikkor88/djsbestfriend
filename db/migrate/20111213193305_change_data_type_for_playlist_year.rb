class ChangeDataTypeForPlaylistYear < ActiveRecord::Migration
   def change
		remove_column :playlists, :year
		add_column :playlists, :year, :date
  end
end
