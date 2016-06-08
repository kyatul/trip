class AddColumnToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :destination_id, :integer
  end
end
