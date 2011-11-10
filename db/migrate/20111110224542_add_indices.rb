class AddIndices < ActiveRecord::Migration
  def change
		add_index :releases, [:id, :title]
		add_index :releases, [:title, :catalog_number], :unique => true
	end
end
