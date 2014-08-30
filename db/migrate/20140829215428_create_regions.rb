class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.decimal :max_latitude
      t.decimal :min_latitude
      t.decimal :max_longitude
      t.decimal :min_longitude
      t.timestamps
    end
  end
end
