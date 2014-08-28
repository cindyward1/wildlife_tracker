class CreateSighting < ActiveRecord::Migration
  def change

    create_table :sightings do |t|
      t.date :date
      t.decimal :latitude
      t.decimal :longitude
      t.integer :specie_id
      t.string :subspecies
      t.integer :region_id
      t.timestamps
    end

    add_column :species, :created_at, :timestamp
    add_column :species, :updated_at, :timestamp

  end
end
