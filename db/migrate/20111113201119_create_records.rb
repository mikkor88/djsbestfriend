class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :title
      t.string :artist
      t.string :genre
      t.string :record_type
      t.integer :year
      t.text :comment
      t.string :catalog_number

      t.timestamps
    end
		add_index :records, [:id, :title]
		add_index :records, [:title, :catalog_number], :unique => true
  end
end
