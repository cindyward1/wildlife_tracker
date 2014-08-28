class CreateSpecie < ActiveRecord::Migration
  def change
    create_table :species do |t|
      t.string :name
    end
  end
end
