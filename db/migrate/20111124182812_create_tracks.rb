class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :artist
      t.string :genre
      t.integer :year
			t.integer :track_number
      t.integer :bpm
      t.time :duration
      t.integer :record_id

      t.timestamps
    end
		add_index :tracks, [:record_id, :track_number]
  end
end
