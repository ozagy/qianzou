class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.string :description
      t.integer :ordervalue

      t.timestamps
    end
  end
end
