class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :title
      t.string :grouping
      t.text :description
      t.integer :year
      t.time :duration

      t.timestamps
    end
  end
end
