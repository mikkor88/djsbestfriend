class ChangeDataTypeForYear < ActiveRecord::Migration
  def change
		remove_column :records, :year
		add_column :records, :year, :date
  end
end
