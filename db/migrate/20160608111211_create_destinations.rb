class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :state
      t.string :city

      t.timestamps null: false
    end
  end
end
