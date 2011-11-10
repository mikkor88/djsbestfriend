class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :title
      t.string :artist
      t.string :genre
      t.string :type
      t.integer :year
      t.text :comment
      t.string :catalog_number

      t.timestamps
    end
  end
end
